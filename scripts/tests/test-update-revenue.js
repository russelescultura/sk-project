const { PrismaClient } = require('@prisma/client');

async function testUpdateRevenue() {
  const prisma = new PrismaClient();
  
  try {
    console.log('Testing revenue update...');
    
    // Get the GCash revenue entry
    const revenue = await prisma.revenue.findFirst({
      where: {
        source: 'GCASH',
        formSubmissionId: 'cmdwjeutb0005piol3jva21yt'
      },
      include: {
        formSubmission: true
      }
    });
    
    if (revenue) {
      console.log('Found revenue entry:', revenue);
      
      // Parse the submission data to get the user name
      const submissionData = JSON.parse(revenue.formSubmission.data);
      console.log('Submission data:', submissionData);
      
      const userName = submissionData['Full Name'] || 'User';
      console.log('User name from submission:', userName);
      
      // Update the revenue description
      const updatedRevenue = await prisma.revenue.update({
        where: { id: revenue.id },
        data: {
          description: `Automatic revenue from form submission by ${userName}`
        }
      });
      
      console.log('✅ Updated revenue entry:', updatedRevenue);
    } else {
      console.log('No revenue entry found');
    }
    
  } catch (error) {
    console.log('Error:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

testUpdateRevenue(); 