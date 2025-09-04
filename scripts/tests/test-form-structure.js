const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function testFormStructure() {
  try {
    // Get a form with GCash receipt fields
    const forms = await prisma.form.findMany({
      where: {
        gcashReceipt: true
      },
      take: 1
    })

    if (forms.length === 0) {
      console.log('No forms with GCash receipt found')
      return
    }

    const form = forms[0]
    console.log('Form ID:', form.id)
    console.log('Form title:', form.title)
    console.log('Form fields (raw):', form.fields)
    
    // Parse the fields
    const parsedFields = JSON.parse(form.fields)
    console.log('Parsed fields:', JSON.stringify(parsedFields, null, 2))
    
    // Check if it's an array
    if (Array.isArray(parsedFields)) {
      console.log('Fields is an array with', parsedFields.length, 'items')
      
      // Find GCash fields
      const gcashFields = parsedFields.filter(field => field.type === 'gcashReceipt')
      console.log('GCash fields found:', gcashFields.length)
      gcashFields.forEach((field, index) => {
        console.log(`GCash field ${index}:`, field)
      })
    } else {
      console.log('Fields is not an array:', typeof parsedFields)
    }

  } catch (error) {
    console.error('Error:', error)
  } finally {
    await prisma.$disconnect()
  }
}

testFormStructure()
