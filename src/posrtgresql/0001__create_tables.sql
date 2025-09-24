CREATE TABLE IF NOT EXISTS faculties (
    id SERIAL PRIMARY KEY,
    faculty_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS groups (
    id SERIAL PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL,
    faculty_id INT REFERENCES faculties(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    group_id INT REFERENCES groups(id) ON DELETE SET NULL,
    enrollment_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE IF NOT EXISTS enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    grade DECIMAL(3, 2) CHECK (grade >= 0 AND grade <= 100)
);

CREATE TABLE IF NOT EXISTS lecturers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS teaching (
    id SERIAL PRIMARY KEY,
    lecturer_id INT REFERENCES lecturers(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    semester VARCHAR(20) NOT NULL
);
