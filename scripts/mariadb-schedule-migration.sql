-- MariaDB-Compatible Schedule Migration Script
-- This script works with MariaDB and avoids dynamic SQL syntax issues

USE sk_project;

-- 1. Check current table structure
SELECT 'Current programs table structure:' AS info;
DESCRIBE programs;

-- 2. Add columns safely (MariaDB will error if column exists, but that's OK)
-- Add start_time
SELECT 'Adding start_time column...' AS info;
ALTER TABLE programs ADD COLUMN start_time TIME;

-- Add end_time  
SELECT 'Adding end_time column...' AS info;
ALTER TABLE programs ADD COLUMN end_time TIME;

-- Add frequency
SELECT 'Adding frequency column...' AS info;
ALTER TABLE programs ADD COLUMN frequency ENUM('DAILY', 'WEEKLY', 'BI_WEEKLY', 'MONTHLY', 'CUSTOM');

-- Add frequency_interval
SELECT 'Adding frequency_interval column...' AS info;
ALTER TABLE programs ADD COLUMN frequency_interval INT DEFAULT 1;

-- Add days_of_week
SELECT 'Adding days_of_week column...' AS info;
ALTER TABLE programs ADD COLUMN days_of_week JSON;

-- Add timezone
SELECT 'Adding timezone column...' AS info;
ALTER TABLE programs ADD COLUMN timezone VARCHAR(50) DEFAULT 'Asia/Manila';

-- Add schedule_exceptions
SELECT 'Adding schedule_exceptions column...' AS info;
ALTER TABLE programs ADD COLUMN schedule_exceptions JSON;

-- 3. Update existing records with default values
SELECT 'Updating existing records with default values...' AS info;
UPDATE programs SET 
  start_time = '09:00:00',
  end_time = '17:00:00',
  frequency = 'WEEKLY',
  frequency_interval = 1,
  days_of_week = '["MONDAY"]',
  timezone = 'Asia/Manila',
  schedule_exceptions = '[]'
WHERE start_time IS NULL;

-- 4. Add indexes safely
SELECT 'Adding performance indexes...' AS info;

-- Add schedule_type index (skip if exists)
CREATE INDEX idx_programs_schedule_type ON programs(schedule_type);

-- Add frequency index (skip if exists)
CREATE INDEX idx_programs_frequency ON programs(frequency);

-- Add days_of_week index (MariaDB compatible)
CREATE INDEX idx_programs_days_of_week ON programs(days_of_week);

-- 5. Show final table structure
SELECT 'Final programs table structure:' AS info;
DESCRIBE programs;

-- 6. Show migration summary
SELECT 'Migration completed successfully!' AS result;
SELECT 
  COUNT(*) AS total_programs,
  SUM(CASE WHEN start_time IS NOT NULL THEN 1 ELSE 0 END) AS programs_with_schedule,
  SUM(CASE WHEN start_time IS NULL THEN 1 ELSE 0 END) AS programs_needing_update
FROM programs;
