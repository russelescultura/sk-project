// Detailed test script to debug the sync process
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function testDetailedSync() {
  try {
    console.log('🔍 Detailed sync test...');

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
      }
    });

    console.log(`Found ${approvedSubmissions.length} approved submissions`);

    for (const submission of approvedSubmissions) {
      console.log(`\n--- Processing submission ${submission.id} ---`);
      console.log(`Form fields:`, submission.form.fields);
      console.log(`Submission data:`, submission.data);
      
      try {
        const formFields = JSON.parse(submission.form.fields);
        const submissionData = JSON.parse(submission.data);
        
        console.log(`Parsed form fields:`, formFields);
        console.log(`Parsed submission data:`, submissionData);
        
        // Find gcashReceipt fields
        const gcashFields = formFields.filter(field => field.type === 'gcashReceipt');
        console.log(`Found ${gcashFields.length} GCash receipt fields:`, gcashFields);
        
        for (const gcashField of gcashFields) {
          console.log(`\n--- Processing field: ${gcashField.name} ---`);
          
          const fieldValue = submissionData[gcashField.name];
          const amountValue = submissionData[`${gcashField.name}_amount`];
          const receiptValue = submissionData[`${gcashField.name}_receipt`];
          
          console.log(`Field value:`, fieldValue);
          console.log(`Amount value:`, amountValue);
          console.log(`Receipt value:`, receiptValue);
          
          if (!amountValue) {
            console.log(`❌ No amount found for field ${gcashField.name}`);
            continue;
          }

          const amount = parseFloat(amountValue);
          console.log(`Parsed amount: ${amount}`);
          
          if (amount <= 0) {
            console.log(`❌ Amount is 0 or negative`);
            continue;
          }

          console.log(`✅ Valid GCash payment found: ₱${amount}`);
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
testDetailedSync(); 