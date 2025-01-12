CREATE TABLE Analysis (
    an_id INT PRIMARY KEY AUTO_INCREMENT,
    an_name VARCHAR(255),
    an_cost DECIMAL(10,2),
    an_price DECIMAL(10,2),
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES Groups(gr_id)
);

CREATE TABLE Orders (
    ord_id INT PRIMARY KEY AUTO_INCREMENT,
    ord_datetime DATETIME,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

CREATE TABLE Groups_1 (
    gr_id INT PRIMARY KEY AUTO_INCREMENT,
    gr_name VARCHAR(255),
    gr_temp VARCHAR(50)
);
