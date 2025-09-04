-- Ultimate Schedule Migration Script
-- This will add all missing columns and update data automatically

USE sk_project;

-- 1. Show what we have
SELECT '=== CURRENT STRUCTURE ===' AS info;
DESCRIBE programs;

-- 2. Add missing columns (MariaDB will skip if they exist)
SELECT '=== ADDING MISSING COLUMNS ===' AS info;

-- Try to add each column - ignore errors if they exist
ALTER TABLE programs ADD COLUMN end_time TIME;
ALTER TABLE programs ADD COLUMN frequency ENUM('DAILY', 'WEEKLY', 'BI_WEEKLY', 'MONTHLY', 'CUSTOM');
ALTER TABLE programs ADD COLUMN frequency_interval INT DEFAULT 1;
ALTER TABLE programs ADD COLUMN days_of_week JSON;
ALTER TABLE programs ADD COLUMN timezone VARCHAR(50) DEFAULT 'Asia/Manila';
ALTER TABLE programs ADD COLUMN schedule_exceptions JSON;

-- 3. Update existing records
SELECT '=== UPDATING EXISTING RECORDS ===' AS info;
UPDATE programs SET 
  start_time = '09:00:00',
  end_time = '17:00:00',
  frequency = 'WEEKLY',
  frequency_interval = 1,
  days_of_week = '["MONDAY"]',
  timezone = 'Asia/Manila',
  schedule_exceptions = '[]'
WHERE start_time IS NULL;

-- 4. Add indexes
SELECT '=== ADDING INDEXES ===' AS info;
CREATE INDEX IF NOT EXISTS idx_programs_schedule_type ON programs(schedule_type);
CREATE INDEX IF NOT EXISTS idx_programs_frequency ON programs(frequency);
CREATE INDEX IF NOT EXISTS idx_programs_days_of_week ON programs(days_of_week);

-- 5. Show final result
SELECT '=== FINAL STRUCTURE ===' AS info;
DESCRIBE programs;

SELECT '=== MIGRATION COMPLETE! ===' AS success;
