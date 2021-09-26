CREATE TABLE listings
(
	property_id		SERIAL PRIMARY KEY,
	full_address	VARCHAR,
	status			VARCHAR,
	property_type	VARCHAR(30),
	price			NUMERIC,
	price_per_sq_ft	NUMERIC,
	hoa_fees		NUMERIC,
	bed				VARCHAR,
	bath			VARCHAR,
	built_area		VARCHAR,
	parking_garage	INTEGER,
	year_built		INTEGER,
	street_address	VARCHAR,
	city			VARCHAR(30),
	state_cd		VARCHAR(2),
	zip_code		VARCHAR(10),
	load_datetime	TIMESTAMP
)

DROP TABLE listings

--INSERT INTO listings ("Price", "Bed", "Bath", "BuiltArea", "Address") VALUES ('$839,000', '3bed', '2bath', '1,200sqft', '2778 Mission Village Dr, San Diego, CA 92123')
 
SELECT * FROM listings

CREATE TABLE listings
(
	property_id		SERIAL PRIMARY KEY,
	price			VARCHAR,
	bed				VARCHAR,
	bath			VARCHAR,
	built_area		VARCHAR,
	full_address	VARCHAR,
	street_address	VARCHAR,
	city			VARCHAR(30),
	state_cd		VARCHAR(2),
	zip_code		VARCHAR(10),
	property_type	VARCHAR(30),
	price_per_sq_ft	NUMERIC,
	hoa_fees		NUMERIC,
	parking_garage	INTEGER,
	year_built		INTEGER,
	load_datetime	TIMESTAMP
)