const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function updateFormsPublishStatus() {
  try {
    console.log('Updating existing forms with default publish status...')
    
    // First, let's see what forms exist
    const forms = await prisma.form.findMany()
    console.log(`Found ${forms.length} forms`)
    
    // Update each form individually
    for (const form of forms) {
      await prisma.form.update({
        where: { id: form.id },
        data: { publishStatus: 'DRAFT' }
      })
      console.log(`Updated form: ${form.title}`)
    }
    
    console.log('All forms updated successfully!')
    
    // Verify the update
    const updatedForms = await prisma.form.findMany()
    console.log('Current forms with publish status:')
    updatedForms.forEach(form => {
      console.log(`- ${form.title}: ${form.publishStatus}`)
    })
    
  } catch (error) {
    console.error('Error updating forms:', error)
  } finally {
    await prisma.$disconnect()
  }
}

updateFormsPublishStatus() 