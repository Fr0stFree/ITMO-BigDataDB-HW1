INSERT INTO faculties (faculty_name) VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics');

INSERT INTO groups (group_name, faculty_id) VALUES
    ('CS101', 1),
    ('MATH201', 2),
    ('PHYS301', 3),
    ('CS102', 1),
    ('MATH202', 2),
    ('PHYS302', 3);

INSERT INTO students (full_name, group_id, enrollment_year) VALUES
    ('Alice Johnson', 1, 2021),
    ('Bob Smith', 2, 2020),
    ('Charlie Brown', 3, 2019),
    ('Diana Prince', 1, 2022),
    ('Ethan Hunt', 2, 2021),
    ('Fiona Glenanne', 3, 2020),
    ('George Costanza', 1, 2019),
    ('Hannah Baker', 2, 2022),
    ('Ian Malcolm', 3, 2021),
    ('Jane Doe', 1, 2020),
    ('Kevin Flynn', 2, 2019),
    ('Laura Palmer', 3, 2022),
    ('Michael Scott', 1, 2021),
    ('Nina Williams', 2, 2020),
    ('Oscar Martinez', 3, 2019),
    ('Pam Beesly', 1, 2022),
    ('Quentin Tarantino', 2, 2021),
    ('Rachel Green', 3, 2020),
    ('Sam Winchester', 1, 2019),
    ('Tina Fey', 2, 2022);

INSERT INTO courses (course_name, credits) VALUES
    ('Database Systems', 4),
    ('Calculus I', 3),
    ('Classical Mechanics', 4),
    ('Operating Systems', 4),
    ('Linear Algebra', 3),
    ('Quantum Physics', 4),
    ('Data Structures', 4),
    ('Statistics', 3),
    ('Electromagnetism', 4),
    ('Computer Networks', 4);

DO $$
DECLARE
    student RECORD;
    course RECORD;
    grade DECIMAL(5, 2);
BEGIN
    FOR student IN SELECT * FROM students LOOP
        FOR course IN SELECT * FROM courses LOOP
            grade := ROUND((RANDOM() * 100)::numeric, 2);
            INSERT INTO enrollments (student_id, course_id, grade) VALUES (student.id, course.id, grade);
        END LOOP;
    END LOOP;
END $$;

INSERT INTO lecturers (full_name, department) VALUES
    ('Dr. Emily Carter', 'Computer Science'),
    ('Dr. John Doe', 'Mathematics'),
    ('Dr. Sarah Lee', 'Physics'),
    ('Dr. Mark Taylor', 'Computer Science'),
    ('Dr. Anna Kim', 'Mathematics'),
    ('Dr. James Wilson', 'Physics');

INSERT INTO teaching (lecturer_id, course_id, semester) VALUES
    (1, 1, 'Fall 2023'),
    (2, 2, 'Spring 2024'),
    (3, 3, 'Fall 2023'),
    (4, 4, 'Spring 2024'),
    (5, 5, 'Fall 2023'),
    (6, 6, 'Spring 2024'),
    (1, 7, 'Fall 2023'),
    (2, 8, 'Spring 2024'),
    (3, 9, 'Fall 2023'),
    (4, 10, 'Spring 2024'),
    (5, 1, 'Fall 2023'),
    (6, 2, 'Spring 2024'),
    (1, 3, 'Fall 2023'),
    (2, 4, 'Spring 2024'),
    (3, 5, 'Fall 2023'),
    (4, 6, 'Spring 2024');
