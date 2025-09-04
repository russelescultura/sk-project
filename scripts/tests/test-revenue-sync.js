// Test script to verify revenue sync functionality
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));

async function testRevenueSync() {
  try {
    console.log('🔄 Testing revenue sync...');

    const response = await fetch('http://localhost:3000/api/revenue/sync-gcash', {
      method: 'POST',
    });

    if (response.ok) {
      const result = await response.json();
      console.log('✅ Revenue sync successful!');
      console.log('📊 Results:', result);
    } else {
      console.log('❌ Revenue sync failed');
      const error = await response.text();
      console.log('Error:', error);
    }
  } catch (error) {
    console.log('❌ Test failed:', error.message);
  }
}

// Run the test
testRevenueSync(); 