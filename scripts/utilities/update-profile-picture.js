const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function updateProfilePicture() {
  try {
    console.log('🔍 Updating youth profile with profile picture...');

    // Get the youth profile for Ronald E. Escultua
    const youthProfile = await prisma.youthProfile.findFirst({
      where: {
        fullName: 'Ronald E. Escultua'
      }
    });

    if (!youthProfile) {
      console.log('❌ Youth profile not found');
      return;
    }

    console.log('Found youth profile:', youthProfile.trackingId);

    // Get the submission to extract the profile picture
    const submission = await prisma.formSubmission.findUnique({
      where: { id: 'cme2fq7vj0001vw5iy2nojvt7' }
    });

    if (!submission) {
      console.log('❌ Submission not found');
      return;
    }

    const submissionData = JSON.parse(submission.data);
    const profilePicture = submissionData['Profile Picture (2x2)'] || submissionData['Profile Picture (2x2)*'];

    console.log('Profile picture from submission:', profilePicture);

    if (profilePicture) {
      // Update the youth profile with the profile picture
      const updatedProfile = await prisma.youthProfile.update({
        where: { id: youthProfile.id },
        data: {
          profilePicture: profilePicture
        }
      });

      console.log('✅ Updated youth profile with profile picture:', updatedProfile.profilePicture);
    } else {
      console.log('⚠️ No profile picture found in submission data');
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

updateProfilePicture();
