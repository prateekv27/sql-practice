 database SATELLITEAQUISATIONSYSTEM;
use SATELLITEAQUISATIONSYSTEM;

CREATE TABLE Satellite (
    satellite_id INT PRIMARY KEY,
    satellite_name VARCHAR(100),
    launch_date DATE,
    description TEXT
);


CREATE TABLE GroundStation (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    Location VARCHAR(255),
    contact_person VARCHAR(100)
);


CREATE TABLE Sensor (
    sensor_id INT PRIMARY KEY,
    satellite_id INT,
    sensor_name VARCHAR(100),
    sensor_type VARCHAR(100),
    FOREIGN KEY (satellite_id) REFERENCES Satellite(satellite_id)
);
CREATE TABLE Image (
image_id INT PRIMARY KEY,
    satellite_id INT,
    station_id INT, 
    capture_date DATE,
    resolution VARCHAR(50),
    file_location VARCHAR(255),
    FOREIGN KEY (satellite_id) REFERENCES Satellite(satellite_id),
    FOREIGN KEY (station_id) REFERENCES GroundStation(station_id)
);