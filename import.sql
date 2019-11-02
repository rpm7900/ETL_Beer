truncate breweries_brewpub cascade;
truncate city_pop cascade;
truncate beers cascade;
truncate best_beers cascade;
truncate zip_county cascade;
truncate breweries cascade;

\copy breweries_brewpub from 'CSV/breweries_and_brew_pubs_in_the_usa.csv' csv delimiter ',' header;
\copy city_pop(state, city, population) from 'CSV/us_city_populations.csv' csv delimiter ',' header;
\copy beers from 'CSV/beers.csv' csv delimiter ',' header;
\copy best_beers(united_states,brewpub,brewer_tap_room,bar) from 'CSV/best_beers_by_state.csv' csv delimiter ',' header;
\copy zip_county(zip,stcountyfp,city,state,countyname,classfp) from 'CSV/zip_county_fips_2018-03.csv' csv delimiter ',' header;
\copy breweries from 'CSV/breweries.csv' csv delimiter ',' header;