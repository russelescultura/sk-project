const { PrismaClient } = require('@prisma/client');

async function testSyncSimulation() {
  const prisma = new PrismaClient();
  
  try {
    console.log('🔍 Testing sync simulation...');

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
      
      try {
        console.log(`Raw form fields:`, submission.form.fields);
        console.log(`Raw form fields type:`, typeof submission.form.fields);
        
        const formFields = JSON.parse(submission.form.fields);
        const submissionData = JSON.parse(submission.data);
        
        console.log(`Parsed form fields:`, formFields);
        console.log(`Type of formFields:`, typeof formFields);
        console.log(`Is array:`, Array.isArray(formFields));
        console.log(`FormFields length:`, formFields?.length);
        console.log(`Parsed submission data:`, submissionData);
        
        // Ensure formFields is an array
        let fieldsArray = formFields;
        if (typeof formFields === 'string') {
          try {
            fieldsArray = JSON.parse(formFields);
          } catch (error) {
            console.log('Could not parse formFields as JSON:', error.message);
            continue;
          }
        }
        
        console.log(`Final fieldsArray:`, fieldsArray);
        console.log(`Is array:`, Array.isArray(fieldsArray));
        
        // Find gcashReceipt fields
        const gcashFields = fieldsArray.filter(field => field.type === 'gcashReceipt');
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
          
          // Check if revenue already exists
          const existingRevenue = await prisma.revenue.findFirst({
            where: {
              formSubmissionId: submission.id,
              source: 'GCASH',
              title: {
                contains: `GCash Payment - ${gcashField.label || 'Payment'}`
              }
            }
          });

          console.log(`Existing revenue check:`, existingRevenue);

          if (existingRevenue) {
            console.log(`❌ Revenue already exists, skipping`);
            continue;
          }

          console.log(`✅ Creating revenue entry...`);
          
          // Create revenue entry
          const revenue = await prisma.revenue.create({
            data: {
              title: `GCash Payment - ${gcashField.label || 'Payment'}`,
              description: `Automatic revenue from form submission by ${submission.user?.name || 'User'}`,
              amount: amount,
              source: 'GCASH',
              date: submission.submittedAt,
              status: 'APPROVED',
              programId: submission.form.event.program.id,
              formSubmissionId: submission.id,
              receipt: receiptValue || null
            }
          });

          console.log(`✅ Created revenue entry:`, revenue);
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
testSyncSimulation(); 