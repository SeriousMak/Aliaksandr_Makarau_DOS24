INSERT INTO Groups_1 (gr_name, gr_temp) VALUES
('Group A', 'Temp 1'),
('Group B', 'Temp 2'),
('Group C', 'Temp 3');

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES
('Analysis 1', 40, 60, 1),  
('Analysis 2', 80, 100, 2),  
('Analysis 3', 120, 140, 3);  

INSERT INTO Orders (ord_datetime, ord_an) VALUES
('2020-02-05 9:00:00', 1),  
('2020-02-10 11:00:00', 2),  
('2024-01-03 12:20:00', 3); 