CREATE TABLE IF NOT EXISTS VEHICLE(
  vehicle_id TEXT PRIMARY KEY,
  model TEXT,
  brand TEXT,
  city TEXT,
  price INTEGER
);

INSERT INTO VEHICLE(vehicle_id, model, brand, city, price)
VALUES
  ('V001', 'Camry', 'Toyota', 'New York', 25000),
  ('V002', 'Civic', 'Honda', 'Los Angeles', 20000),
  ('V003', 'Model S', 'Tesla', 'Chicago', 80000),
  ('V004', 'F-150', 'Ford', 'Houston', 35000),
  ('V005', 'Mustang', 'Ford', 'Phoenix', 45000),
  ('V006', 'Prius', 'Toyota', 'Philadelphia', 22000);

CREATE TABLE IF NOT EXISTS Driver(
  driver_id TEXT PRIMARY KEY,
  driver_name TEXT,
  city TEXT,
  license_number TEXT
);

INSERT INTO Driver(driver_id, driver_name, city, license_number)
VALUES
  ('D001', 'John Doe', 'New York', 'L001'),
  ('D002', 'Jane Smith', 'Los Angeles', 'L002'),
  ('D003', 'Bob Johnson', 'Chicago', 'L003'),
  ('D004', 'Alice Williams', 'Houston', 'L004'),
  ('D005', 'Charlie Brown', 'Phoenix', 'L005'),
  ('D006', 'David Davis', 'Philadelphia', 'L006');

CREATE TABLE IF NOT EXISTS Rides(
  ord_no TEXT PRIMARY KEY,
  purch_amt REAL,
  ord_date TEXT,
  customer_id TEXT,
  Salesman_id TEXT
);

INSERT INTO Rides(ord_no, purch_amt, ord_date, customer_id, Salesman_id)
VALUES
  ('70001', 150.5, '2012-10-05', '3005', '5002'),
  ('70009', 270.65, '2012-09-10', '3001', '5001'),
  ('70002', 65.26, '2012-10-05', '3002', '5003'),
  ('70004', 110.5, '2012-08-17', '3009', '5007'),
  ('70007', 948.5, '2012-09-10', '3005', '5005'),
  ('70005', 2400.6, '2012-07-27', '3007', '5006');

-- Queries

-- Matching drivers and vehicles by city
SELECT d.driver_name, v.model, v.brand
FROM Driver d
JOIN VEHICLE v ON d.city = v.city;

-- Linking drivers to their vehicles
SELECT d.driver_name, v.model, v.brand
FROM Driver d
JOIN VEHICLE v ON d.city = v.city;

-- Fetching rides where driver's city does not match vehicle's city
SELECT r.ord_no, d.driver_name, r.customer_id, r.Salesman_id
FROM Rides r
JOIN Driver d ON r.customer_id = d.driver_id
JOIN VEHICLE v ON r.Salesman_id = v.vehicle_id
WHERE d.city <> v.city;

-- Fetching all rides with driver names
SELECT r.ord_no, d.driver_name
FROM Rides r
JOIN Driver d ON r.customer_id = d.driver_id;

-- Drivers with vehicles and prices between 20000 and 30000
SELECT d.driver_name AS Driver,
       d.city AS City,
       v.model AS Vehicle,
       v.brand AS Brand,
       v.price AS Price
FROM Driver d
JOIN VEHICLE v ON d.city = v.city
WHERE v.price BETWEEN 20000 AND 30000;

-- Orders on a specific date
SELECT r.*, d.driver_name
FROM Rides r
JOIN Driver d ON r.customer_id = d.driver_id
WHERE r.ord_date = '2012-10-05';