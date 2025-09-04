// Test script to check if Revenue model is accessible
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function testPrismaRevenue() {
  try {
    console.log('🔍 Testing Prisma Revenue model access...');

    // Try to access the revenue model
    console.log('Checking if revenue model exists...');
    
    // List all models to see what's available
    console.log('Available Prisma models:');
    console.log(Object.keys(prisma));
    
    // Try to count revenues
    try {
      const count = await prisma.revenue.count();
      console.log(`✅ Revenue model accessible. Count: ${count}`);
    } catch (error) {
      console.log(`❌ Revenue model not accessible:`, error.message);
    }
    
    // Try to find revenues
    try {
      const revenues = await prisma.revenue.findMany({
        take: 5
      });
      console.log(`✅ Found ${revenues.length} revenue entries`);
    } catch (error) {
      console.log(`❌ Could not find revenues:`, error.message);
    }

  } catch (error) {
    console.log('❌ Test failed:', error.message);
  } finally {
    await prisma.$disconnect();
  }
}

// Run the test
testPrismaRevenue(); 