--drop table if exists
drop table if exists proc_tires;

--create table
create table proc_tires (
plant_id bigint,
plant_name varchar,
tiquet bigint,
client_id bigint,
client_name varchar,
tire_dimension varchar,
tire_design varchar,
entry_date date ,
driver_id varchar,
driver_name varchar,
dot varchar,
brand_id varchar,
brand_name varchar,
vendor_id varchar,
vendor_name varchar,
zone varchar,
segment varchar,
license_plate varchar
);

--load data
COPY proc_tires FROM '/data/processed_tires_2011.csv' DELIMITER ',' CSV HEADER;
COPY proc_tires FROM '/data/processed_tires_2012.csv' DELIMITER ',' CSV HEADER;
