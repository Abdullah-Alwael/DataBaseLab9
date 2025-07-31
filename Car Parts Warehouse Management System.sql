#DDL
CREATE DATABASE CAR_PARTS_WAREHOUSE_MANAGEMENT_SYSTEM;

USE CAR_PARTS_WAREHOUSE_MANAGEMENT_SYSTEM;

CREATE TABLE owners
(
    id           varchar(12) primary key,
    name         varchar(20) not null,
    location     varchar(30) not null,
    phone_number varchar(13) not null
);

CREATE TABLE warehouses
(
    id       varchar(12) primary key,
    name     varchar(30) not null,
    location varchar(30) not null,
    capacity int         not null default 0
);

CREATE TABLE cars
(
    id    varchar(12) primary key,
    model varchar(20) not null,
    make  varchar(20) not null,
    year  datetime    not null default now()
);

CREATE TABLE parts
(
    id           varchar(12) primary key,
    name         varchar(30) not null,
    price        double default 0,
    warehouse_id varchar(12),
    owner_id     varchar(12),
    foreign key (owner_id) references owners (id),
    foreign key (warehouse_id) references warehouses (id)
);

CREATE TABLE car_parts
(
    car_id  varchar(12),
    part_id varchar(12),
    primary key (car_id, part_id),
    foreign key (car_id) references cars (id),
    foreign key (part_id) references parts (id)
);

#DML
#Inserts

INSERT INTO owners
VALUES ('OWN001',
        'AutoParts King',
        'Riyadh, KSA',
        '+966501234567');

INSERT INTO owners
VALUES ('OWN002',
        'Global Car Spares',
        'Jeddah, KSA',
        '+966559876543');

INSERT INTO owners
VALUES ('OWN003',
        'Elite Automotive Co.',
        'Dammam, KSA',
        '+966532109876');

INSERT INTO owners
VALUES ('OWN004',
        'Desert Motors Parts',
        'Khobar, KSA',
        '+966567890123');

INSERT INTO owners
VALUES ('OWN005',
        'Prime Auto Supply',
        'Mecca, KSA',
        '+966591234567');

INSERT INTO warehouses
VALUES ('WH001',
        'Riyadh Main Warehouse',
        'Riyadh Industrial Area',
        5000);

INSERT INTO warehouses
VALUES ('WH002',
        'Jeddah Logistics Hub',
        'Jeddah Port Zone',
        3500);

INSERT INTO warehouses
VALUES ('WH003',
        'Dammam Distribution Center',
        'Dammam West',
        4000);

INSERT INTO warehouses
VALUES ('WH004',
        'Khobar Storage Facility',
        'Khobar North',
        2500);

INSERT INTO warehouses
VALUES ('WH005',
        'Mecca Regional Depot',
        'Mecca Industrial Park',
        3000);

INSERT INTO cars
VALUES ('CAR001',
        'Camry',
        'Toyota',
        DEFAULT);

INSERT INTO cars
VALUES ('CAR002',
        'F-150',
        'Ford',
        DEFAULT);

INSERT INTO cars
VALUES ('CAR003',
        'C-Class',
        'Mercedes-Benz',
        DEFAULT);

INSERT INTO cars
VALUES ('CAR004',
        'Civic',
        'Honda',
        DEFAULT);

INSERT INTO cars
VALUES ('CAR005',
        'X5',
        'BMW',
        DEFAULT);

INSERT INTO parts
VALUES ('PART001',
        'Brake Pad Set',
        75.50,
        'WH001',
        'OWN001');

INSERT INTO parts
VALUES ('PART002',
        'Oil Filter',
        15.00,
        'WH002',
        'OWN002');

INSERT INTO parts
VALUES ('PART003',
        'Spark Plug  VALUES (4-pack)',
        30.25,
        'WH001',
        'OWN003');

INSERT INTO parts
VALUES ('PART004',
        'Headlight Assembly',
        250.99,
        'WH003',
        'OWN004');

INSERT INTO parts
VALUES ('PART005',
        'Air Filter',
        22.75,
        'WH002',
        'OWN005');

INSERT INTO car_parts
VALUES ('CAR001',
        'PART001');

INSERT INTO car_parts
VALUES ('CAR002',
        'PART002');

INSERT INTO car_parts
VALUES ('CAR003',
        'PART004');

INSERT INTO car_parts
VALUES ('CAR001',
        'PART003');

INSERT INTO car_parts
VALUES ('CAR005',
        'PART005');

#Selects
SELECT * FROM owners;
SELECT * FROM warehouses;
SELECT * FROM cars;
SELECT * FROM parts;
SELECT * FROM car_parts;

#Updates
update owners set phone_number = '+966501234777' where id = 'OWN001';
UPDATE warehouses set name = 'updated name of warehouse in Riyadh' where id = 'WH001';
UPDATE cars set make = 'The new Mercedes' where id = 'CAR003';
UPDATE parts set price = 2507.68 where id = 'PART004';
UPDATE car_parts set car_id = 'CAR004' where car_id = 'CAR001' and car_parts.part_id = 'PART003';

#Deletes
DELETE FROM owners where id = 'OWN001'; # can not delete
DELETE FROM warehouses where id = 'WH002'; # can not delete
DELETE FROM cars where id = 'CAR003'; # can not delete, but after deleting the car_parts below, it is possible to delete
DELETE FROM parts where id = 'PART004'; # can not delete, but after deleting the car_parts below, it is possible to delete
DELETE FROM car_parts where car_id = 'CAR003' and part_id = 'PART004'; # delete success, then you can delete from above
