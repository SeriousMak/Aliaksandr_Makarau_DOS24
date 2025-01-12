CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE
);

CREATE TABLE Courses (
    courses_id INT AUTO_INCREMENT PRIMARY KEY,
    name_courses VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, enrollment_date) VALUES
(1, 'Александр', 'Макаров', '1995-02-28', 'sashamkr@mail.ru','2024-10-20'),
(2, 'Олег', 'Петров', '1993-09-20', 'user@gmail.com','2024-08-10'),
(3, 'Игорь', 'Иванов', '1994-05-06', 'qwerty@yandex.ru','2023-05-25');

INSERT INTO Courses (name_courses, student_id) VALUES
('DevOps-инженер', 1),  
('Бизнес аналитика', 3),  
('UX/UI дизайнер', 1); 