drop table if exists store_tmp;
create table store_tmp (
  s_store_sk integer, 
  s_store_id string, 
  s_rec_start_date date, 
  s_rec_end_date date, 
  s_closed_date_sk integer, 
  s_store_name string, 
  s_number_employees integer, 
  s_floor_space integer, 
  s_hours string, 
  s_manager string, 
  s_market_id integer, 
  s_geography_class string, 
  s_market_desc string, 
  s_market_manager string, 
  s_division_id integer, 
  s_division_name string, 
  s_company_id integer, 
  s_company_name string, 
  s_street_number string, 
  s_street_name string, 
  s_street_type string, 
  s_suite_number string, 
  s_city string, 
  s_county string, 
  s_state string, 
  s_zip string, 
  s_country string, 
  s_gmt_offset decimal(5, 2), 
  s_tax_precentage decimal(5, 2)
) using csv options(header "false", delimiter "|", path "${path}/${name}.dat");
drop table if exists store;
create table store using parquet location '${path}/${name}/parquet' as (select * from store_tmp);
drop table if exists store_tmp;