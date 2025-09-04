-- Fix time columns to store time strings directly instead of TIME columns
-- This prevents timezone conversion issues

-- Change start_time from TIME to VARCHAR(5) to store "HH:MM" format
ALTER TABLE programs MODIFY COLUMN start_time VARCHAR(5);

-- Change end_time from TIME to VARCHAR(5) to store "HH:MM" format  
ALTER TABLE programs MODIFY COLUMN end_time VARCHAR(5);

-- Update existing data to convert from TIME to VARCHAR format
-- This will extract just the time portion from existing TIME values
UPDATE programs 
SET start_time = TIME_FORMAT(start_time, '%H:%i')
WHERE start_time IS NOT NULL;

UPDATE programs 
SET end_time = TIME_FORMAT(end_time, '%H:%i')
WHERE end_time IS NOT NULL;
