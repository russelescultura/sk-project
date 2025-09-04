# Scripts Directory

This directory contains various utility scripts, tests, and migration tools for the SK Project.

## Directory Structure

### `/migrations`
Contains database migration and setup scripts:
- `run_category_migration.bat/.ps1` - Category migration scripts
- `run_image_column_update.bat/.ps1` - Image column update scripts
- `run_revenue_migration.bat` - Revenue migration script

### `/tests`
Contains test scripts for various functionality:
- `test-*.js` - Various test scripts for revenue, forms, and sync operations

### `/utilities`
Contains utility scripts for maintenance and updates:
- `setup-database.js` - Database setup and initialization
- `trigger-youth-profiles.js` - Youth profile management
- `update-forms-publish-status.js` - Form status updates
- `update-profile-picture.js` - Profile picture updates

### Root Scripts
- `create-placeholder-images.js` - Creates placeholder images for testing
- `db-check.js` - Database connection and health checks
- `seed-admin.js` - Admin user seeding script

## Usage

Run scripts from the project root directory. Most scripts require Node.js and may require database connection setup.

## Notes

- Always backup your database before running migration scripts
- Test scripts in a development environment first
- Some scripts may require specific environment variables or database credentials
