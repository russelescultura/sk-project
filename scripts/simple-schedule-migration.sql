-- Simple Schedule Migration Script
-- Run this in your MySQL database step by step

USE sk_project;

-- 1. Show current structure
DESCRIBE programs;

-- 2. Add columns one by one (run each ALTER statement separately)

-- Add start_time if it doesn't exist
ALTER TABLE programs ADD COLUMN start_time TIME;

-- Add end_time if it doesn't exist  
ALTER TABLE programs ADD COLUMN end_time TIME;

-- Add frequency if it doesn't exist
ALTER TABLE programs ADD COLUMN frequency ENUM('DAILY', 'WEEKLY', 'BI_WEEKLY', 'MONTHLY', 'CUSTOM');

-- Add frequency_interval if it doesn't exist
ALTER TABLE programs ADD COLUMN frequency_interval INT DEFAULT 1;

-- Add days_of_week if it doesn't exist
ALTER TABLE programs ADD COLUMN days_of_week JSON;

-- Add timezone if it doesn't exist
ALTER TABLE programs ADD COLUMN timezone VARCHAR(50) DEFAULT 'Asia/Manila';

-- Add schedule_exceptions if it doesn't exist
ALTER TABLE programs ADD COLUMN schedule_exceptions JSON;

-- 3. Update existing records
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
CREATE INDEX idx_programs_schedule_type ON programs(schedule_type);
CREATE INDEX idx_programs_frequency ON programs(frequency);
CREATE INDEX idx_programs_days_of_week ON programs((CAST(days_of_week AS CHAR(100))));

-- 5. Show final structure
DESCRIBE programs;
