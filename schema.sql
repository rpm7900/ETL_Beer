DROP TABLE breweries_brewpub CASCADE;
DROP TABLE city_pop CASCADE;
DROP TABLE beers CASCADE;
DROP TABLE best_beers CASCADE;
DROP TABLE zip_county CASCADE;
DROP TABLE breweries CASCADE;
DROP TABLE zip_county_city_pop CASCADE;
DROP TABLE zip_county_beer CASCADE;
DROP TABLE breweries_brewpub_beers CASCADE;

CREATE TABLE breweries_brewpub(
    id VARCHAR PRIMARY KEY,
    address VARCHAR,
    categories VARCHAR,
    city VARCHAR,
    country VARCHAR,
    hours VARCHAR,
    keys VARCHAR,
    latitude FLOAT,
    longitude FLOAT,
    menus VARCHAR,
    name VARCHAR,
    postalcode VARCHAR,
    province VARCHAR,
    twitter VARCHAR,
    websites VARCHAR  
);

CREATE TABLE city_pop(
    id SERIAL PRIMARY KEY,
    state VARCHAR,
    city VARCHAR,
    population VARCHAR
);

CREATE TABLE beers(
    beer_id SERIAL PRIMARY KEY,
    abv FLOAT,
    ibu FLOAT,
    id INT,
    name VARCHAR,
    style VARCHAR,
    brewery_id INT,
    ounces FLOAT
);
CREATE TABLE best_beers(
    id SERIAL PRIMARY KEY,
    united_states VARCHAR,
    brewpub VARCHAR,
    brewer_tap_room VARCHAR,
	bar VARCHAR
);
CREATE TABLE zip_county(
    id SERIAL PRIMARY KEY,
    zip VARCHAR,
    stcountyfp VARCHAR,
    city VARCHAR,
	state VARCHAR,
	countyname VARCHAR,
	classfp VARCHAR
);
CREATE TABLE breweries(
    breweries_id SERIAL PRIMARY KEY,
    name VARCHAR,
    city VARCHAR,
    state VARCHAR,
    id INT 
);
CREATE TABLE zip_county_city_pop(
    id SERIAL PRIMARY KEY,
    zip_county_id INT REFERENCES zip_county (id),
    city_pop_id INT REFERENCES city_pop (id)
);
CREATE TABLE zip_county_beer(
    id SERIAL PRIMARY KEY,
    zip_county_id INT REFERENCES zip_county (id),
    best_beers_id INT REFERENCES best_beers (id)
);
CREATE TABLE breweries_brewpub_beers(
    id SERIAL PRIMARY KEY,
    breweries_brewpub_id INT REFERENCES breweries (breweries_id), 
    beer_id INT REFERENCES beers (beer_id)
);