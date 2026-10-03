-- ============================================================
-- Student Attendance Analysis
-- 02 - Data Exploration
-- ============================================================

-- 1. Select the project database
-- Purpose: Make sure all queries use the correct database

USE student_attendance;


-- ============================================================
-- 2. Count total students
-- Purpose: Find the total number of records in our dataset
-- ============================================================

SELECT COUNT(*) AS total_students
FROM maths;


-- ============================================================
-- 3. View all column names
-- Purpose: Understand what information is available
-- ============================================================

SHOW COLUMNS
FROM maths;


-- ============================================================
-- 4. View the first 10 records
-- Purpose: Understand the actual values in the dataset
-- ============================================================

SELECT *
FROM maths
LIMIT 10;


-- ============================================================
-- 5. Count total students
-- Purpose: Find the total number of student records
-- ============================================================

SELECT COUNT(*) AS total_students
FROM maths;

-- ============================================================
-- 6. Student distribution by gender
-- Purpose: Understand the number of male and female students
-- ============================================================

SELECT 
    sex,
    COUNT(*) AS student_count
FROM maths
GROUP BY sex;


-- ============================================================
-- 7. Student distribution by school
-- Purpose: Understand how many students belong to each school
-- ============================================================

SELECT
    school,
    COUNT(*) AS student_count
FROM maths
GROUP BY school
ORDER BY student_count DESC;

-- ============================================================
-- 8. Student distribution by age
-- Purpose: Understand how many students belong to each age group
-- ============================================================

SELECT
    age,
    COUNT(*) AS student_count
FROM maths
GROUP BY age
ORDER BY age;

-- ============================================================
-- 9. Gender distribution by school
-- Purpose: Compare the number of male and female students
--          within each school
-- ============================================================

-- ============================================================
-- 10. Average age by school
-- Purpose: Compare the average age of students between schools
-- ============================================================

SELECT
    school,
    ROUND(AVG(age), 2) AS average_age
FROM maths
GROUP BY school
ORDER BY average_age DESC;

-- ============================================================
-- 11. Check academic performance columns
-- Purpose: Confirm the score columns available for analysis
-- ============================================================

SHOW COLUMNS FROM maths;

-- ============================================================
-- 12. Average academic performance
-- Purpose: Calculate average G1, G2 and final G3 scores
-- ============================================================

SELECT
    ROUND(AVG(G1), 2) AS avg_G1,
    ROUND(AVG(G2), 2) AS avg_G2,
    ROUND(AVG(G3), 2) AS avg_G3
FROM maths;

-- ============================================================
-- 13. Final performance by gender
-- Purpose: Compare average final scores between male and female students
-- ============================================================

SELECT
    sex,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY sex
ORDER BY average_G3 DESC;


-- ============================================================
-- 14. Study time vs final performance
-- Purpose: Compare final scores based on weekly study time
-- ============================================================

SELECT
    studytime,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY studytime
ORDER BY studytime;

-- ============================================================
-- 15. Parent education vs final performance
-- Purpose: Analyze whether parental education is associated
--          with students' final G3 score
-- ============================================================

SELECT
    Medu AS mother_education,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY Medu
ORDER BY Medu;

-- ============================================================
-- 16. Father education vs final performance
-- Purpose: Analyze whether father's education is associated
--          with students' final G3 score
-- ============================================================

SELECT
    Fedu AS father_education,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY Fedu
ORDER BY father_education;

-- ============================================================
-- 17. Study time vs final performance
-- Purpose: Analyze final G3 score by study time
-- ============================================================

SELECT
    studytime,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY studytime
ORDER BY studytime;

-- ============================================================
-- 18. Absences vs final performance
-- Purpose: Analyze final G3 score by number of absences
-- ============================================================

SELECT
    absences,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY absences
ORDER BY absences;

-- ============================================================
-- 19. Final performance distribution
-- Purpose: Categorize students based on final G3 score
-- ============================================================

SELECT
    CASE
        WHEN G3 <= 9 THEN 'Needs Improvement'
        WHEN G3 <= 13 THEN 'Average'
        WHEN G3 <= 16 THEN 'Good'
        ELSE 'Excellent'
    END AS performance_category,
    COUNT(*) AS student_count
FROM maths
GROUP BY performance_category
ORDER BY student_count DESC;


-- ============================================================
-- 20. Previous failures vs final performance
-- Purpose: Analyze whether previous failures are associated
--          with students' final G3 score
-- ============================================================

SELECT
    failures,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY failures
ORDER BY failures;

-- ============================================================
-- 21. Study time vs final performance
-- Purpose: Analyze whether study time is associated
--          with students' final G3 score
-- ============================================================

SELECT
    studytime,
    COUNT(*) AS student_count,
    ROUND(AVG(G3), 2) AS average_G3
FROM maths
GROUP BY studytime
ORDER BY studytime;

-- ============================================================
-- 22. Pass vs Fail distribution
-- Purpose: Categorize students based on final G3 score
-- ============================================================

SELECT
    CASE
        WHEN G3 >= 10 THEN 'Pass'
        ELSE 'Fail'
    END AS result,
    COUNT(*) AS student_count
FROM maths
GROUP BY result
ORDER BY student_count DESC;

-- ============================================================
-- 23. Pass rate by gender
-- Purpose: Compare student pass/fail outcomes by gender
-- ============================================================

SELECT
    sex,
    COUNT(*) AS total_students,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS passed_students,
    ROUND(
        SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS pass_rate
FROM maths
GROUP BY sex
ORDER BY pass_rate DESC;

-- ============================================================
-- 24. Pass rate by study time
-- Purpose: Compare student pass rates based on study time
-- ============================================================

SELECT
    studytime,
    COUNT(*) AS total_students,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS passed_students,
    ROUND(
        SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS pass_rate
FROM maths
GROUP BY studytime
ORDER BY studytime;

-- ============================================================
SHOW COLUMNS FROM maths;


-- =========================================================
-- 25. Pass rate by higher education aspiration
-- Purpose: Compare student pass rates based on higher education plans
-- =========================================================

SELECT
    higher,
    COUNT(*) AS total_students,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS passed_students,
    ROUND(
        SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS pass_rate
FROM maths
GROUP BY higher
ORDER BY pass_rate DESC;

-- =========================================================
-- 26. Average final score by gender
-- Purpose: Compare academic performance by gender
-- =========================================================

SELECT
    sex,
    COUNT(*) AS total_students,
    ROUND(AVG(G3), 2) AS average_G3,
    MAX(G3) AS highest_G3,
    MIN(G3) AS lowest_G3
FROM maths
GROUP BY sex
ORDER BY average_G3 DESC;

-- =========================================================
-- 27. Performance by mother's education
-- Purpose: Analyze whether mother's education level
-- is associated with student performance
-- =========================================================

SELECT
    Medu AS mother_education,
    COUNT(*) AS total_students,
    ROUND(AVG(G3), 2) AS average_G3,
    MAX(G3) AS highest_G3,
    MIN(G3) AS lowest_G3
FROM maths
GROUP BY Medu
ORDER BY mother_education;


-- =========================================================
-- 28. Performance by father's education
-- Purpose: Analyze student performance by father's education
-- =========================================================

SELECT
    Fedu AS father_education,
    COUNT(*) AS total_students,
    ROUND(AVG(G3), 2) AS average_G3,
    MAX(G3) AS highest_G3,
    MIN(G3) AS lowest_G3
FROM maths
GROUP BY Fedu
ORDER BY father_education;

-- =========================================================
-- 29. Study time vs final performance
-- Purpose: Analyze the relationship between study time
-- and students' final G3 score
-- =========================================================

SELECT
    studytime,
    COUNT(*) AS total_students,
    ROUND(AVG(G3), 2) AS average_G3,
    MAX(G3) AS highest_G3,
    MIN(G3) AS lowest_G3
FROM maths
GROUP BY studytime
ORDER BY studytime;

-- ============================================================
-- FINAL BUSINESS INSIGHTS
-- ============================================================
-- Project: Student Performance & Learning Analytics
-- Purpose: Summarize key findings from SQL data exploration
-- ============================================================

-- 1. Gender Performance
-- Compare average G3 scores and pass rates between male and female students.

-- 2. Study Time
-- Examine whether students with higher study time have better average G3 scores.

-- 3. Test Preparation
-- Compare student pass rates based on whether they completed a test preparation course.

-- 4. Higher Education
-- Compare pass rates and average G3 scores between students who want higher education
-- and those who do not.

-- 5. Mother's Education
-- Analyze whether mother's education level is associated with student performance.

-- 6. Father's Education
-- Analyze whether father's education level is associated with student performance.

-- 7. Overall Performance
-- Identify overall student count, average G3 score, highest score, lowest score,
-- and pass rate.