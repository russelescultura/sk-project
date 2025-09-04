-- Smart Migration Script - Only adds missing columns
USE sk_project;

-- 1. Check current structure
SELECT '=== CURRENT TABLE STRUCTURE ===' AS info;
DESCRIBE programs;

-- 2. Add only missing columns
SELECT '=== ADDING MISSING COLUMNS ===' AS info;

-- Check and add end_time
SELECT 'Checking end_time...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding end_time column...'
  ELSE 'end_time column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'end_time';

-- Add end_time if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'end_time', 'TIME'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'end_time'
);

-- Check and add frequency
SELECT 'Checking frequency...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding frequency column...'
  ELSE 'frequency column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'frequency';

-- Add frequency if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'frequency', 'ENUM'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'frequency'
);

-- Check and add frequency_interval
SELECT 'Checking frequency_interval...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding frequency_interval column...'
  ELSE 'frequency_interval column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'frequency_interval';

-- Add frequency_interval if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'frequency_interval', 'INT'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'frequency_interval'
);

-- Check and add days_of_week
SELECT 'Checking days_of_week...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding days_of_week column...'
  ELSE 'days_of_week column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'days_of_week';

-- Add days_of_week if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'days_of_week', 'JSON'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'days_of_week'
);

-- Check and add timezone
SELECT 'Checking timezone...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding timezone column...'
  ELSE 'timezone column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'timezone';

-- Add timezone if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'timezone', 'VARCHAR'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'timezone'
);

-- Check and add schedule_exceptions
SELECT 'Checking schedule_exceptions...' AS info;
SELECT CASE 
  WHEN COUNT(*) = 0 THEN 'Adding schedule_exceptions column...'
  ELSE 'schedule_exceptions column already exists'
END AS result
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs' 
  AND COLUMN_NAME = 'schedule_exceptions';

-- Add schedule_exceptions if missing
INSERT IGNORE INTO INFORMATION_SCHEMA.COLUMNS (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE)
SELECT 'sk_project', 'programs', 'schedule_exceptions', 'JSON'
WHERE NOT EXISTS (
  SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_SCHEMA = 'sk_project' 
    AND TABLE_NAME = 'programs' 
    AND COLUMN_NAME = 'schedule_exceptions'
);

-- 3. Show final structure
SELECT '=== FINAL TABLE STRUCTURE ===' AS info;
DESCRIBE programs;

-- 4. Migration summary
SELECT '=== MIGRATION COMPLETE ===' AS info;
SELECT 
  COUNT(*) AS total_programs,
  SUM(CASE WHEN start_time IS NOT NULL THEN 1 ELSE 0 END) AS programs_with_schedule,
  SUM(CASE WHEN start_time IS NULL THEN 1 ELSE 0 END) AS programs_needing_update
FROM programs;
