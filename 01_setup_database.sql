-- =====================================================
-- Student Attendance Analysis
-- 01 - Database Setup
-- =====================================================

-- Select the database for this project
USE student_attendance;
-- ============================================================
-- 2. Check the imported student attendance table
-- Purpose: Confirm that the Excel/CSV data was imported correctly
-- ============================================================

SHOW TABLES;


-- ============================================================
-- 3. View the first 10 records
-- Purpose: Check the actual student data
-- ============================================================

SELECT *
FROM maths
LIMIT 10;


-- ============================================================
-- 4. Check the table structure
-- Purpose: Understand column names and data types
-- ============================================================

DESCRIBE maths;

