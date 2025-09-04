// Test script to examine submission data structure
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function testSubmissionData() {
  try {
    console.log('🔍 Examining submission data structure...');

    const approvedSubmissions = await prisma.formSubmission.findMany({
      where: {
        status: 'APPROVED'
      },
      include: {
        form: {
          include: {
            event: {
              include: {
                program: true
              }
            }
          }
        },
        user: {
          select: {
            name: true,
            email: true
          }
        }
      },
      take: 1
    });

    console.log(`Found ${approvedSubmissions.length} approved submissions`);

    if (approvedSubmissions.length > 0) {
      const submission = approvedSubmissions[0];
      console.log('Submission ID:', submission.id);
      console.log('Form fields:', submission.form.fields);
      console.log('Submission data:', submission.data);
      
      try {
        const formFields = JSON.parse(submission.form.fields);
        const submissionData = JSON.parse(submission.data);
        
        console.log('Parsed form fields:', formFields);
        console.log('Parsed submission data:', submissionData);
        
        // Find gcashReceipt fields
        const gcashFields = formFields.filter(field => field.type === 'gcashReceipt');
        console.log('GCash receipt fields:', gcashFields);
        
        // Check what values are in submission data
        for (const field of gcashFields) {
          console.log(`Field ${field.name} (${field.label}):`, submissionData[field.name]);
        }
        
      } catch (error) {
        console.log('Parse error:', error.message);
      }
    }

  } catch (error) {
    console.log('❌ Test failed:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

// Run the test
testSubmissionData(); 