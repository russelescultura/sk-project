-- Complete Schedule Migration Script
-- This script safely adds missing schedule columns without duplicates

USE sk_project;

-- 1. Check current table structure
SELECT 'Current programs table structure:' AS info;
DESCRIBE programs;

-- 2. Add missing columns safely
-- Check and add start_time
SELECT 'Checking start_time column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'start_time') = 0,
    'ALTER TABLE programs ADD COLUMN start_time TIME;',
    'SELECT "start_time column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add end_time
SELECT 'Checking end_time column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'end_time') = 0,
    'ALTER TABLE programs ADD COLUMN end_time TIME;',
    'SELECT "end_time column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add frequency
SELECT 'Checking frequency column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'frequency') = 0,
    'ALTER TABLE programs ADD COLUMN frequency ENUM("DAILY", "WEEKLY", "BI_WEEKLY", "MONTHLY", "CUSTOM");',
    'SELECT "frequency column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add frequency_interval
SELECT 'Checking frequency_interval column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'frequency_interval') = 0,
    'ALTER TABLE programs ADD COLUMN frequency_interval INT DEFAULT 1;',
    'SELECT "frequency_interval column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add days_of_week
SELECT 'Checking days_of_week column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'days_of_week') = 0,
    'ALTER TABLE programs ADD COLUMN days_of_week JSON;',
    'SELECT "days_of_week column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add timezone
SELECT 'Checking timezone column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'timezone') = 0,
    'ALTER TABLE programs ADD COLUMN timezone VARCHAR(50) DEFAULT "Asia/Manila";',
    'SELECT "timezone column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add schedule_exceptions
SELECT 'Checking schedule_exceptions column...' AS info;
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND COLUMN_NAME = 'schedule_exceptions') = 0,
    'ALTER TABLE programs ADD COLUMN schedule_exceptions JSON;',
    'SELECT "schedule_exceptions column already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

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

-- Check and add schedule_type index
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND INDEX_NAME = 'idx_programs_schedule_type') = 0,
    'CREATE INDEX idx_programs_schedule_type ON programs(schedule_type);',
    'SELECT "schedule_type index already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add frequency index
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND INDEX_NAME = 'idx_programs_frequency') = 0,
    'CREATE INDEX idx_programs_frequency ON programs(frequency);',
    'SELECT "frequency index already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add days_of_week index
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS 
     WHERE TABLE_SCHEMA = 'sk_project' 
       AND TABLE_NAME = 'programs' 
       AND INDEX_NAME = 'idx_programs_days_of_week') = 0,
    'CREATE INDEX idx_programs_days_of_week ON programs((CAST(days_of_week AS CHAR(100))));',
    'SELECT "days_of_week index already exists" AS result;'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

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
