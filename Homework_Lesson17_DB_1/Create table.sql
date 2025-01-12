CREATE TABLE Analysis (
    an_id INT PRIMARY KEY,
    an_name VARCHAR(100),
    an_cost DECIMAL(10, 2),
    an_price DECIMAL(10, 2),
    an_group INT,
    FOREIGN KEY (an_group) REFERENCES Groups(gr_id)
);

CREATE TABLE Groups (
    gr_id INT PRIMARY KEY,
    gr_name VARCHAR(100),
    gr_temp VARCHAR(50)
);

CREATE TABLE Orders (
    ord_id INT PRIMARY KEY,
    ord_datetime DATETIME,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);