const mysql = require('mysql2/promise')
const pool = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'sk_project',
	waitForConnections: true,
	connectionLimit: 10,
	queueLimit: 0,
})

async function main() {
	try {
		console.log('Checking MySQL connection and schema...')
		const [tables] = await pool.query('SHOW TABLES')
		console.log('Tables:')
		for (const row of tables) {
			console.log(' -', Object.values(row)[0])
		}

		async function count(table) {
			try {
				const [rows] = await pool.query(`SELECT COUNT(*) as c FROM ${table}`)
				console.log(`${table}:`, rows[0].c)
			} catch (e) {
				console.log(`${table}: ERROR ->`, e.message)
			}
		}

		await count('users')
		await count('programs')
		await count('events')
		await count('forms')
		await count('form_submissions')
		await count('sk_members')
		await count('content')

		// Show columns for key tables
		const tablesToDescribe = ['programs', 'events', 'content', 'sk_members']
		for (const t of tablesToDescribe) {
			try {
				const [cols] = await pool.query(`SHOW COLUMNS FROM ${t}`)
				console.log(`\nColumns for ${t}:`)
				for (const col of cols) console.log(` - ${col.Field} (${col.Type})`)
			} catch (e) {
				console.log(`\n${t}: SHOW COLUMNS ERROR ->`, e.message)
			}
		}
	} catch (e) {
		console.error('DB check failed:', e)
	} finally {
		await pool.end()
	}
}

main()


