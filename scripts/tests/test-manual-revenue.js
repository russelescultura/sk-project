const { PrismaClient } = require('@prisma/client');

async function testManualRevenue() {
  const prisma = new PrismaClient();
  
  try {
    console.log('Testing manual revenue creation...');
    
    // Get the first program
    const program = await prisma.program.findFirst();
    console.log('Using program:', program?.id);
    
    if (!program) {
      console.log('No program found');
      return;
    }
    
    // Create a test revenue entry
    const revenue = await prisma.revenue.create({
      data: {
        title: 'Test GCash Payment',
        description: 'Test revenue entry',
        amount: 1000,
        source: 'GCASH',
        date: new Date(),
        status: 'APPROVED',
        programId: program.id,
        formSubmissionId: null,
        receipt: null
      }
    });
    
    console.log('✅ Created test revenue:', revenue);
    
    // Clean up - delete the test entry
    await prisma.revenue.delete({
      where: { id: revenue.id }
    });
    
    console.log('✅ Deleted test revenue');
    
  } catch (error) {
    console.log('Error:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

testManualRevenue(); 