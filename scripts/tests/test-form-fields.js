// Test script to check form fields structure
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function testFormFields() {
  try {
    console.log('🔍 Checking form fields structure...');

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
      take: 1 // Just get one to test
    });

    console.log(`Found ${approvedSubmissions.length} approved submissions`);

    if (approvedSubmissions.length > 0) {
      const submission = approvedSubmissions[0];
      console.log('Submission ID:', submission.id);
      console.log('Form fields raw:', submission.form.fields);
      
      try {
        const parsed = JSON.parse(submission.form.fields);
        console.log('Parsed form fields:', parsed);
        console.log('Type of parsed:', typeof parsed);
        console.log('Is array:', Array.isArray(parsed));
        
        if (typeof parsed === 'object' && parsed !== null) {
          console.log('Object keys:', Object.keys(parsed));
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
testFormFields(); 