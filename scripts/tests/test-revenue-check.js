const { PrismaClient } = require('@prisma/client');

async function testRevenueCheck() {
  const prisma = new PrismaClient();
  
  try {
    console.log('Testing revenue check for GCash submission...');
    
    const submissionId = 'cmdwjeutb0005piol3jva21yt';
    
    // Check if revenue already exists for this submission
    const existingRevenue = await prisma.revenue.findFirst({
      where: {
        formSubmissionId: submissionId,
        source: 'GCASH',
        title: {
          contains: 'GCash Payment'
        }
      }
    });
    
    console.log('Existing revenue for submission:', existingRevenue);
    
    if (existingRevenue) {
      console.log('✅ Revenue already exists, that\'s why sync is skipping');
    } else {
      console.log('❌ No existing revenue found, sync should create one');
    }
    
  } catch (error) {
    console.log('Error:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

testRevenueCheck(); 