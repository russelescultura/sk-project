const fs = require('fs')
const path = require('path')

// Create placeholder images directory
const imagesDir = path.join(__dirname, '..', 'public', 'images', 'profiles')
if (!fs.existsSync(imagesDir)) {
  fs.mkdirSync(imagesDir, { recursive: true })
}

// Create simple SVG placeholder images
const createPlaceholderImage = (name, filename) => {
  const initials = name.split(' ').map(n => n[0]).join('')
  const svg = `
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect width="200" height="200" fill="#e5e7eb"/>
  <circle cx="100" cy="80" r="40" fill="#3b82f6"/>
  <text x="100" y="90" text-anchor="middle" fill="white" font-family="Arial" font-size="24" font-weight="bold">${initials}</text>
  <text x="100" y="140" text-anchor="middle" fill="#6b7280" font-family="Arial" font-size="14">${name}</text>
</svg>`

  fs.writeFileSync(path.join(imagesDir, filename), svg)
}

// Create placeholder images for sample data
const profiles = [
  { name: 'Maria Santos', filename: 'maria-santos.jpg' },
  { name: 'Juan Dela Cruz', filename: 'juan-delacruz.jpg' },
  { name: 'Ana Reyes', filename: 'ana-reyes.jpg' },
  { name: 'Carlos Mendoza', filename: 'carlos-mendoza.jpg' },
  { name: 'Carmen Lopez', filename: 'carmen-lopez.jpg' },
  { name: 'Luis Martinez', filename: 'luis-martinez.jpg' }
]

profiles.forEach(profile => {
  createPlaceholderImage(profile.name, profile.filename)
  console.log(`Created placeholder image: ${profile.filename}`)
})

console.log('✅ Placeholder images created successfully!') 