-- Check existing columns in programs table
USE sk_project;

-- Show all existing columns
SHOW COLUMNS FROM programs;

-- Show table structure
DESCRIBE programs;

-- Check specific columns
SELECT 
  COLUMN_NAME,
  DATA_TYPE,
  IS_NULLABLE,
  COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'sk_project' 
  AND TABLE_NAME = 'programs'
ORDER BY ORDINAL_POSITION;
