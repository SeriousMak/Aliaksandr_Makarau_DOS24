SELECT an_name, an_price
FROM Analysis
JOIN Orders ON an_id = ord_an
WHERE ord_datetime >= '2020-02-05 00:00:00'
  AND ord_datetime < '2020-02-12 00:00:00';