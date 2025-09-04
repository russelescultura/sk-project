const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function triggerYouthProfileCreation() {
  try {
    console.log('🔍 Finding approved Youth Registration Form submissions...');

    // Get all approved submissions for Youth Registration Forms
    const approvedSubmissions = await prisma.formSubmission.findMany({
      where: {
        status: 'APPROVED'
      },
      include: {
        form: true
      }
    });

    console.log(`Found ${approvedSubmissions.length} approved submissions`);

    // Debug: Show all submissions
    for (const submission of approvedSubmissions) {
      console.log(`Submission ${submission.id}: "${submission.form.title}"`);
    }

    let processedCount = 0;
    let successCount = 0;
    let errorCount = 0;

    for (const submission of approvedSubmissions) {
      // Check if this is a Youth Registration Form
      if (submission.form.title.toLowerCase().includes('youth registration')) {
        console.log(`\n🔄 Processing submission: ${submission.id}`);
        console.log(`Form title: ${submission.form.title}`);
        
        try {
          // Parse submission data
          const submissionData = JSON.parse(submission.data);
          console.log('Submission data keys:', Object.keys(submissionData));
          console.log('Full submission data:', JSON.stringify(submissionData, null, 2));
          
          // Map form data to youth profile fields
          const youthProfileData = mapFormDataToYouthProfile(submissionData);
          console.log('Mapped youth profile data:', youthProfileData);
          
          // Check what data we have
          console.log('Available data in submission:', submissionData);
          
          // For the first submission, we need to handle missing data
          if (submission.id === 'cmdwjeutb0005piol3jva21yt') {
            console.log('⚠️ First submission has incomplete data - skipping');
            continue;
          }
          
          // Validate required fields
          if (!youthProfileData.fullName || !youthProfileData.mobileNumber || !youthProfileData.dateOfBirth) {
            console.log(`⚠️ Missing required fields for ${submission.id}:`, {
              fullName: youthProfileData.fullName,
              mobileNumber: youthProfileData.mobileNumber,
              dateOfBirth: youthProfileData.dateOfBirth
            });
            continue;
          }

          // Check if youth profile already exists
          const existingProfile = await prisma.youthProfile.findFirst({
            where: {
              fullName: youthProfileData.fullName,
              mobileNumber: youthProfileData.mobileNumber,
              dateOfBirth: youthProfileData.dateOfBirth ? new Date(youthProfileData.dateOfBirth) : undefined
            }
          });

          if (existingProfile) {
            console.log(`⚠️ Youth profile already exists for ${youthProfileData.fullName}`);
            continue;
          }

          // Calculate age from date of birth
          const birthDate = new Date(youthProfileData.dateOfBirth);
          const today = new Date();
          const age = today.getFullYear() - birthDate.getFullYear();
          const monthDiff = today.getMonth() - birthDate.getMonth();
          const actualAge = monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate()) ? age - 1 : age;

          // Generate tracking ID
          const trackingId = `SK-${new Date().getFullYear()}-${String(Math.floor(Math.random() * 10000)).padStart(4, '0')}`;

          // Create youth profile
          const youthProfile = await prisma.youthProfile.create({
            data: {
              trackingId,
              fullName: youthProfileData.fullName,
              dateOfBirth: new Date(youthProfileData.dateOfBirth),
              age: actualAge,
              sex: youthProfileData.sex,
              civilStatus: youthProfileData.civilStatus || 'Single',
              profilePicture: youthProfileData.profilePicture,
              mobileNumber: youthProfileData.mobileNumber,
              emailAddress: youthProfileData.emailAddress,
              barangay: youthProfileData.barangay,
              streetAddress: youthProfileData.streetAddress,
              educationLevel: youthProfileData.educationLevel,
              schoolName: youthProfileData.schoolName,
              courseStrand: youthProfileData.courseStrand,
              gradeLevel: youthProfileData.gradeLevel,
              isGraduated: youthProfileData.isGraduated === 'Yes' || youthProfileData.isGraduated === 'true' || youthProfileData.isGraduated === true,
              lastSchoolYear: youthProfileData.lastSchoolYear,
              skills: youthProfileData.skills || '',
              hobbies: youthProfileData.hobbies || '',
              preferredPrograms: youthProfileData.preferredPrograms || '',
              isEmployed: youthProfileData.isEmployed === 'Yes' || youthProfileData.isEmployed === 'true' || youthProfileData.isEmployed === true,
              occupation: youthProfileData.occupation,
              workingHours: youthProfileData.workingHours,
              skMembership: youthProfileData.skMembership === 'Yes' || youthProfileData.skMembership === 'true' || youthProfileData.skMembership === true,
              volunteerExperience: youthProfileData.volunteerExperience || '',
              leadershipRoles: youthProfileData.leadershipRoles || '',
              isPWD: youthProfileData.isPWD === 'Yes' || youthProfileData.isPWD === 'true' || youthProfileData.isPWD === true,
              pwdType: youthProfileData.pwdType,
              indigenousGroup: youthProfileData.indigenousGroup,
              isSoloParent: youthProfileData.isSoloParent === 'Yes' || youthProfileData.isSoloParent === 'true' || youthProfileData.isSoloParent === true,
              specialCases: youthProfileData.specialCases,
              emergencyContactPerson: youthProfileData.emergencyContactPerson,
              emergencyContactNumber: youthProfileData.emergencyContactNumber,
              emergencyRelationship: youthProfileData.emergencyRelationship,
              latitude: youthProfileData.latitude || null,
              longitude: youthProfileData.longitude || null,
              status: 'Active',
              committee: youthProfileData.committee || 'General',
              participation: 0,
              dateOfRegistration: new Date().toISOString().split('T')[0],
              lastActivity: new Date().toISOString().split('T')[0]
            }
          });

          // Update submission notes
          const youthProfileNote = `Youth profile automatically created: ${youthProfile.trackingId}`;
          const currentNotes = submission.notes || '';
          const updatedNotes = currentNotes ? `${currentNotes}\n${youthProfileNote}` : youthProfileNote;

          await prisma.formSubmission.update({
            where: { id: submission.id },
            data: {
              notes: updatedNotes
            }
          });

          console.log(`✅ Created youth profile: ${youthProfile.trackingId} for ${youthProfile.fullName}`);
          successCount++;
          
        } catch (error) {
          console.error(`❌ Error processing submission ${submission.id}:`, error.message);
          errorCount++;
        }
        
        processedCount++;
      }
    }

    console.log(`\n📊 Summary:`);
    console.log(`- Processed: ${processedCount} submissions`);
    console.log(`- Success: ${successCount} youth profiles created`);
    console.log(`- Errors: ${errorCount}`);

  } catch (error) {
    console.error('❌ Script failed:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

// Helper function to map form data to youth profile fields
function mapFormDataToYouthProfile(data) {
  const mapping = {
    // Basic Information
    fullName: data.fullName || data.name || data['Full Name'] || data['Complete Name'],
    dateOfBirth: data.dateOfBirth || data.birthDate || data['Date of Birth'] || data.dob,
    sex: data.sex || data.gender || data['Sex'] || data['Gender'] || data['Select Gender'],
    civilStatus: data.civilStatus || data['Civil Status'] || data.maritalStatus,
    mobileNumber: data.mobileNumber || data.phone || data['Mobile Number'] || data['Contact Number'] || data['Enter mobile number'],
    emailAddress: data.emailAddress || data.email || data['Email Address'],
    profilePicture: data.profilePicture || data['Profile Picture (2x2)*'] || data['Profile Picture (2x2)'] || data['Profile Picture'],
    
    // Address Information
    barangay: data.barangay || data['Barangay'] || data['Municipality and Barangay '] || 'Tulay',
    streetAddress: data.streetAddress || data.address || data['Street Address'] || data['Complete Address'] || data['Street Address/Purok'],
    
    // Education Information
    educationLevel: data.educationLevel || data['Education Level'] || data['Current Education Level'] || data.level,
    schoolName: data.schoolName || data.school || data['School Name'] || data['Current School'],
    courseStrand: data.courseStrand || data.course || data['Course/Strand'] || data['Course/Strand (if SHS/College)'] || data['Program'],
    gradeLevel: data.gradeLevel || data.grade || data['Grade Level'] || data['Year Level'] || data['Enter your grade/year level'],
    isGraduated: data.isGraduated || data.graduated || data['Is Graduated'] || data['Graduated?'],
    lastSchoolYear: data.lastSchoolYear || data['Last School Year'] || data['Last School Year Attended'],
    
    // Skills and Interests
    skills: data.skills || data['Skills'] || data['Special Skills'],
    hobbies: data.hobbies || data['Hobbies'] || data['Interests'] || data['Hobbies/Interests'],
    preferredPrograms: data.preferredPrograms || data['Preferred Programs'] || data['Programs of Interest'] || data['Preferred SK Programs'],
    
    // Employment Information
    isEmployed: data.isEmployed || data.employed || data['Is Employed'] || data['Employed?'],
    occupation: data.occupation || data.job || data['Occupation'] || data['Current Job'] || data['Occupation (if employed)'],
    workingHours: data.workingHours || data['Working Hours'],
    
    // SK Membership
    skMembership: data.skMembership || data.sk || data['SK Membership'] || data['SK Member'] || data['SK Membership or Affiliation'],
    volunteerExperience: data.volunteerExperience || data['Volunteer Experience'] || data['Volunteer Work'] || data['Community Service'],
    leadershipRoles: data.leadershipRoles || data['Leadership Roles'] || data['Leadership Role Held'],
    
    // Special Cases
    isPWD: data.isPWD || data.pwd || data['Is PWD'] || data['Person with Disability'] || data['PWD Status'],
    pwdType: data.pwdType || data['PWD Type'] || data['Type of Disability'] || data['PWD Type (if Yes)'],
    indigenousGroup: data.indigenousGroup || data['Indigenous Group'] || data['Ethnic Group'] || data['Indigenous Group Affiliation'],
    isSoloParent: data.isSoloParent || data['Is Solo Parent'] || data['Single Parent'] || data['Solo Parent'],
    specialCases: data.specialCases || data['Special Cases'],
    
    // Emergency Contact
    emergencyContactPerson: data.emergencyContactPerson || data['Emergency Contact Person'] || data['Emergency Contact'] || data['Emergency Contact Person'],
    emergencyContactNumber: data.emergencyContactNumber || data['Emergency Contact Number'] || data['Emergency Phone'] || data['Emergency Contact Number'],
    emergencyRelationship: data.emergencyRelationship || data['Emergency Relationship'] || data['Relationship'],
    
    // Location
    latitude: data.latitude,
    longitude: data.longitude,
    
    // Committee
    committee: data.committee || data['Committee'] || data['Committee '] || 'General'
  };

  // Clean up undefined values
  Object.keys(mapping).forEach(key => {
    if (mapping[key] === undefined) {
      delete mapping[key];
    }
  });

  return mapping;
}

// Run the script
triggerYouthProfileCreation();