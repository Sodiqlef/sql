CREATE TABLE IF NOT exists student.student (
	studentID int primary key auto_increment not null,
    name varchar(255) not null,
    age int not null,
    department varchar(255)
    
);


CREATE TABLE IF NOT EXISTS student.product (
	productID int primary key auto_increment not null,
    productName varchar(255) not null,
    unitPrice float not null,
    category varchar(255)
    
);


INSERT INTO student.student VALUE (
	101, 'Amos Osamudiamen', 22, 'Computer science'
);

INSERT INTO student.student (name, age, department) VALUES 
	('Olaoluwa Praise', 23, 'computer science'),
    ('Bamisaye Pious', 24, 'Chemistry'),
    ('Oluode Abraham', 23, 'Mathematics'),
    ('Apabio Godwill', 23, 'Chemical Engineering'),
    ('Ademola Adeleke', 22, 'Political Science'),
    ('Babajide Fashola', 24, 'Linguistics'),
    ('Friday oborowevre', 23, 'Mathematics'),
	('Olawunmi Abigeal', 22, 'Computer science'),
    ('Peace Paul', 23, 'Computer science');


INSERT INTO student.product VALUE (
	102, 'Laptop', 1200, 'Electronics'
);


INSERT INTO student.product (productName, unitPrice, category) VALUES 
	('Phone', 1500, 'Electronics'),
    ('Wig', 2000, 'Wears'),
    ('Shirt', 1200, 'Wears'),
    ('Train', 2500, 'Vehicles'),
    ('Television', 700, 'Electronics'),
    ('Cap', 600, 'Wears'),
    ('Camera', 1200, 'Electronics'),
	('car', 3000, 'Vehicle'),
    ('Bicycle', 1100, 'vehicle');
    
    
UPDATE student.product
	SET unitPrice = 3000
	WHERE unitPrice < 1200;
    
    
UPDATE student.student
	SET department = 'biology'
    WHERE studentID = 101;
    
    
DELETE FROM student.product
	where unitPrice < 1500;
    

SELECT name FROM student.student
	WHERE department = 'biology' AND age > 20;
    

SELECT productName FROM student.product 
WHERE unitPrice < 5000 AND category = 'beauty';


SELECT name FROM student.student 
WHERE department = 'chemistry' OR age > 30