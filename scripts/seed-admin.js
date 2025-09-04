const { PrismaClient } = require('@prisma/client')
const bcrypt = require('bcryptjs')

async function main() {
	const prisma = new PrismaClient()
	try {
		const email = 'admin@example.com'
		const existing = await prisma.user.findUnique({ where: { email } })
		if (!existing) {
			await prisma.user.create({
				data: {
					id: 'seed-admin',
					email,
					name: 'Admin',
					password: await bcrypt.hash('password123', 10),
					role: 'ADMIN',
				},
			})
			console.log('Admin created: admin@example.com / password123')
		} else {
			console.log('Admin already exists')
		}
	} catch (e) {
		console.error('Seed admin failed:', e)
		process.exit(1)
	} finally {
		await prisma.$disconnect()
	}
}

main()


