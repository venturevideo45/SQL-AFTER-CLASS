    CREATE TABLE FPVDRONE (
    component_no TEXT PRIMARY KEY,
    component_name TEXT,
    brand_name TEXT,
    price_no TEXT
);

INSERT INTO FPVDRONE (component_no, component_name, brand_name, price_no) VALUES
('COM1', 'Carbon Fiber Frame', 'CarbonTech', '₹1,500 - ₹4,500'),
('COM2', 'Flightcontroller', 'Speedybee', '₹2,000 - ₹3,000'),
('COM3', 'Brushless Motor', 'EMAX ECO', '₹1,200 - ₹1,800'),
('COM4', 'FPV Camera / Video Transmitter', 'DJI O3 Air unit', '₹2,500 - ₹3,500'),
('COM5', 'Controller', 'Radiomaster', '₹1,800 - ₹2,800'),
('COM6', 'Battery', 'Tattu R-Line', '₹3,000 - ₹5,000'),
('COM7', 'Propeller', 'Gemfan Flash', '₹500 - ₹1,000'),
('COM8', 'Antenna', 'Lumenier AXII', '₹800 - ₹1,200'),
('COM9', 'GPS Module', 'Beitian BN-220', '₹1,500 - ₹2,500');


SELECT * FROM FPVDRONE;

SELECT component_name, price_no FROM FPVDRONE
WHERE price_no BETWEEN '₹1,000' AND '₹3,000';

DROP TABLE FPVDRONE;

