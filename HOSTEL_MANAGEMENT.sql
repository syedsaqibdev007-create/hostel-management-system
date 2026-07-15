
CREATE TABLE Student (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    phone_no VARCHAR2(15) UNIQUE,
    father_name VARCHAR2(50),
    gender VARCHAR2(10),
    email VARCHAR2(50),
    address VARCHAR2(100),
    date_of_birth DATE,
    admission_date DATE
);


-- ROOM TABLE
CREATE TABLE Room (
    room_id NUMBER PRIMARY KEY,
    room_no NUMBER UNIQUE,
    total_room NUMBER,
    room_type VARCHAR2(20),
    capacity NUMBER,
    rent NUMBER,
    status VARCHAR2(20)
);
CREATE TABLE Bed (
    bed_id NUMBER PRIMARY KEY,
    room_id NUMBER,
    bed_no NUMBER,
    CONSTRAINT fk_bed_room
    FOREIGN KEY (room_id)
    REFERENCES Room(room_id)
);
-- STAFF TABLE
CREATE TABLE Staff (
    staff_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    cnic VARCHAR2(20) UNIQUE,
    phone_no VARCHAR2(15),
    salary NUMBER,
    role VARCHAR2(30),
    join_date DATE
);
-- ALLOCATION TABLE
CREATE TABLE Allocation (
    allocation_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    room_id NUMBER,
    bed_id NUMBER,
    allocation_date DATE,
    checkout_date DATE,
    status VARCHAR2(20),

    CONSTRAINT fk_alloc_student
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id),

    CONSTRAINT fk_alloc_room
    FOREIGN KEY (room_id)
    REFERENCES Room(room_id),

    CONSTRAINT fk_alloc_bed
    FOREIGN KEY (bed_id)
    REFERENCES Bed(bed_id)
);
-- PAYMENT TABLE
CREATE TABLE Payment (
    payment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    amount NUMBER,
    payment_date DATE,
    status VARCHAR2(20),

    CONSTRAINT fk_payment_student
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id)
);
-- MESS TABLE
CREATE TABLE Mess (
    mess_id NUMBER PRIMARY KEY,
    mess_name VARCHAR2(50),
    charges NUMBER,
    timings VARCHAR2(50),
    status VARCHAR2(20)
);
-- SUBSCRIPTION TABLE
CREATE TABLE Subscription (
    subscription_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    mess_id NUMBER,
    start_date DATE,
    end_date DATE,
    amount NUMBER,

    CONSTRAINT fk_sub_student
    FOREIGN KEY (student_id)
    REFERENCES Student(student_id),

    CONSTRAINT fk_sub_mess
    FOREIGN KEY (mess_id)
    REFERENCES Mess(mess_id)
);

CREATE TABLE HMS_USERS (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE,
    role VARCHAR2(30),
    password VARCHAR2(50),
    phone_no VARCHAR2(15)
);
INSERT INTO Student VALUES
(1,'Usman Tariq','03021234567','Tariq Mehmood','Male',
'usman@gmail.com','Islamabad',
TO_DATE('2001-12-20','YYYY-MM-DD'),
TO_DATE('2024-09-01','YYYY-MM-DD'));

INSERT INTO Student VALUES
(2,'Ali Ahmed','03123456789','Ahmed Raza','Male',
'ali@gmail.com','Lahore',
TO_DATE('2002-05-10','YYYY-MM-DD'),
TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT INTO Student VALUES
(3,'Bilal Khan','03234567890','Khan Ahmed','Male',
'bilal@gmail.com','Karachi',
TO_DATE('2001-07-15','YYYY-MM-DD'),
TO_DATE('2024-09-01','YYYY-MM-DD'));



INSERT INTO Room VALUES (1,101,10,'Single',1,18000,'Available');
INSERT INTO Room VALUES (2,102,10,'Single',1,18000,'Available');
INSERT INTO Room VALUES (3,103,10,'Single',1,18000,'Available');
INSERT INTO Room VALUES (4,104,10,'Single',1,18000,'Available');
INSERT INTO Room VALUES (5,105,10,'Single',1,18000,'Available');

INSERT INTO Room VALUES (6,106,10,'Shared',2,12000,'Available');
INSERT INTO Room VALUES (7,107,10,'Shared',2,12000,'Available');
INSERT INTO Room VALUES (8,108,10,'Shared',2,12000,'Available');
INSERT INTO Room VALUES (9,109,10,'Shared',2,12000,'Available');
INSERT INTO Room VALUES (10,110,10,'Shared',2,12000,'Available');

INSERT INTO Bed VALUES (1,1,1);
INSERT INTO Bed VALUES (2,2,1);
INSERT INTO Bed VALUES (3,3,1);
INSERT INTO Bed VALUES (4,4,1);
INSERT INTO Bed VALUES (5,5,1);

INSERT INTO Bed VALUES (6,6,1);
INSERT INTO Bed VALUES (7,6,2);

INSERT INTO Bed VALUES (8,7,1);
INSERT INTO Bed VALUES (9,7,2);

INSERT INTO Bed VALUES (10,8,1);
INSERT INTO Bed VALUES (11,8,2);

INSERT INTO Bed VALUES (12,9,1);
INSERT INTO Bed VALUES (13,9,2);

INSERT INTO Bed VALUES (14,10,1);
INSERT INTO Bed VALUES (15,10,2);

INSERT INTO Staff VALUES
(1,'Hassan Raza','35202-1234567-1','03111222333',50000,'Warden',
TO_DATE('2023-01-10','YYYY-MM-DD'));

INSERT INTO Staff VALUES
(2,'Ayesha Khan','35202-2345678-2','03211222333',25000,'Cleaner',
TO_DATE('2023-02-15','YYYY-MM-DD'));

INSERT INTO Staff VALUES
(3,'Ali Ahmed','35202-3456789-3','03311222333',30000,'Security Guard',
TO_DATE('2023-03-01','YYYY-MM-DD'));

INSERT INTO Staff VALUES
(4,'Bilal Khan','35202-4567890-4','03411222333',40000,'Accountant',
TO_DATE('2023-04-20','YYYY-MM-DD'));

INSERT INTO Mess VALUES
(1,'Main Mess',5000,'7AM-10PM','Active');

INSERT INTO HMS_USERS VALUES
(1,'admin','Admin','admin123','03001234567');

INSERT INTO HMS_USERS VALUES
(2,'warden1','Warden','warden123','03111222333');

INSERT INTO Allocation VALUES
(1,1,1,1,TO_DATE('2024-09-01','YYYY-MM-DD'),NULL,'Active');

INSERT INTO Allocation VALUES
(2,2,6,6,TO_DATE('2024-09-01','YYYY-MM-DD'),NULL,'Active');

INSERT INTO Allocation VALUES
(3,3,7,8,TO_DATE('2024-09-01','YYYY-MM-DD'),NULL,'Active');

INSERT INTO Payment VALUES
(1,1,18000,TO_DATE('2024-09-05','YYYY-MM-DD'),'Paid');

INSERT INTO Payment VALUES
(2,2,12000,TO_DATE('2024-09-05','YYYY-MM-DD'),'Paid');

INSERT INTO Payment VALUES
(3,3,12000,TO_DATE('2024-09-05','YYYY-MM-DD'),'Unpaid');

INSERT INTO Subscription VALUES
(1,1,1,TO_DATE('2024-09-01','YYYY-MM-DD'),
TO_DATE('2024-12-31','YYYY-MM-DD'),5000);

INSERT INTO Subscription VALUES
(2,2,1,TO_DATE('2024-09-01','YYYY-MM-DD'),
TO_DATE('2024-12-31','YYYY-MM-DD'),5000);



SELECT
    s.student_id,s.name,r.room_no,r.room_type,a.bed_id,a.status

FROM Student s
JOIN Allocation a

    ON s.student_id = a.student_id
JOIN Room r
    ON a.room_id = r.room_id;









-- =====================================================
-- 📊 BASIC COUNTS QUERIES
-- =====================================================
Select table_name
From user_tables
ORDER BY table_name;
SELECT COUNT(*) AS Total_Students FROM Student;

SELECT COUNT(*) AS Total_Rooms FROM Room;

SELECT COUNT(*) AS Total_Beds FROM Bed;

SELECT COUNT(*) AS Total_Staff FROM Staff;

SELECT COUNT(*) AS Total_Users FROM HMS_USERS;

-- =====================================================
-- 🎓 STUDENT QUERIES
-- =====================================================

-- All Students
SELECT *
FROM Student;

SELECT *
FROM Allocation;

-- Male Students
SELECT * 
FROM Student
WHERE gender = 'Male';

-- Students from Islamabad
SELECT * 
FROM Student
WHERE address = 'Islamabad';

-- Students without Room Allocation
SELECT *
FROM Student
WHERE student_id NOT IN (
    SELECT student_id 
    FROM Allocation
);


-- =====================================================
-- 🏠 ROOM QUERIES
-- =====================================================

-- All Rooms
SELECT * 
FROM Room;

-- Available Rooms
SELECT * 
FROM Room 
WHERE status = 'Available';

-- Occupied Rooms
SELECT * 
FROM Room 
WHERE status = 'Occupied';

-- Single Rooms
SELECT * 
FROM Room 
WHERE room_type = 'Single';

-- Shared Rooms
SELECT *
FROM Room 
WHERE room_type = 'Shared';

-- Total Capacity of Rooms
SELECT SUM(capacity) AS Total_Capacity
FROM Room;


-- =====================================================
-- 🛏️ BED QUERIES
-- =====================================================

-- All Beds
SELECT * 
FROM Bed;

-- Available Beds
SELECT *
FROM Bed
WHERE bed_id NOT IN (
    SELECT bed_id 
    FROM Allocation
);


-- =====================================================
-- 👨‍💼 STAFF QUERIES
-- =====================================================

-- All Staff
SELECT * 
FROM Staff;

-- Staff Count by Role
SELECT role, COUNT(*) AS Total_Staff
FROM Staff
GROUP BY role;

-- Total Salary Expense
SELECT SUM(salary) AS Total_Salary 
FROM Staff;




-- All Allocations
SELECT * FROM Allocation;

-- Active Allocations
SELECT * 
FROM Allocation
WHERE status = 'Active';

-- Room Wise Student Count
SELECT room_id, COUNT(student_id) AS Total_Students
FROM Allocation
GROUP BY room_id;


-- =====================================================
-- 🔗 JOIN QUERIES (IMPORTANT FOR VIVA)
-- =====================================================

-- Student + Allocation
SELECT 
    s.student_id,
    s.name,
    a.room_id,
    a.bed_id,
    a.status
FROM Student s
JOIN Allocation a ON s.student_id = a.student_id;


-- Student + Payment
SELECT 
    s.name,
    p.amount,
    p.status,
    p.payment_date
FROM Student s
JOIN Payment p ON s.student_id = p.student_id;


-- Full System View (VERY IMPORTANT)
SELECT 
    s.name,
    r.room_no,
    r.room_type,
    a.bed_id,
    p.amount,
    p.status
FROM Student s
LEFT JOIN Allocation a ON s.student_id = a.student_id
LEFT JOIN Room r ON a.room_id = r.room_id
LEFT JOIN Payment p ON s.student_id = p.student_id;


-- =====================================================
-- 🍽️ MESS QUERIES
-- =====================================================

-- All Mess
SELECT * 
FROM Mess;

-- Active Mess
SELECT * 
FROM Mess 
WHERE status = 'Active';

-- Total Mess Income
SELECT SUM(charges) AS Total_Mess_Income
FROM Mess;


-- =====================================================
-- 📦 SUBSCRIPTION QUERIES
-- =====================================================

-- All Subscriptions
SELECT * 
FROM Subscription;

-- Active Subscriptions
SELECT *
FROM Subscription
WHERE end_date >= SYSDATE;

-- Student + Mess Details
SELECT 
    s.name,
    m.mess_name,
    sub.amount
FROM Student s
JOIN Subscription sub ON s.student_id = sub.student_id
JOIN Mess m ON sub.mess_id = m.mess_id;


-- =====================================================
-- 🔥 ADVANCED VIVA QUERIES
-- =====================================================

-- Latest Payment Per Student
SELECT *
FROM (
    SELECT 
        s.student_id,
        s.name,
        p.amount,
        p.status,
        ROW_NUMBER() OVER (
            PARTITION BY s.student_id 
            ORDER BY p.payment_date DESC
        ) rn
    FROM Student s
    LEFT JOIN Payment p ON s.student_id = p.student_id
)
WHERE rn = 1;


-- Total Revenue (Payment + Mess)
SELECT 
    (SELECT SUM(amount) FROM Payment WHERE status='Paid')
    +
    (SELECT SUM(charges) FROM Mess) AS Total_Revenue;


-- Room Occupancy Percentage
SELECT 
    r.room_id,
    r.capacity,
    COUNT(a.student_id) AS Occupied,
    (COUNT(a.student_id) * 100 / r.capacity) AS Occupancy_Percentage
FROM Room r
LEFT JOIN Allocation a ON r.room_id = a.room_id
GROUP BY r.room_id, r.capacity;


-- =====================================================
-- 🧾 COMPLETE SYSTEM VIEW (FINAL VIVA QUERY)
-- =====================================================

SELECT 
    s.name AS Student_Name,
    r.room_no,
    r.room_type,
    a.bed_id,
    p.amount,
    p.status,
    m.mess_name
FROM Student s
LEFT JOIN Allocation a ON s.student_id = a.student_id
LEFT JOIN Room r ON a.room_id = r.room_id
LEFT JOIN Payment p ON s.student_id = p.student_id
LEFT JOIN Subscription sub ON s.student_id = sub.student_id
LEFT JOIN Mess m ON sub.mess_id = m.mess_id;