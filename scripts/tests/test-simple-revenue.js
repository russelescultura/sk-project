const { PrismaClient } = require('@prisma/client');

async function testRevenue() {
  const prisma = new PrismaClient();
  
  try {
    console.log('Testing Revenue model...');
    const count = await prisma.revenue.count();
    console.log('Revenue count:', count);
    
    const revenues = await prisma.revenue.findMany({
      include: {
        program: true,
        formSubmission: true
      }
    });
    
    console.log('Revenue entries:', revenues);
  } catch (error) {
    console.log('Error:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

testRevenue(); 