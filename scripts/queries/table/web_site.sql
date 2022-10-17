drop table if exists web_site_tmp;
create table web_site_tmp(
    web_site_sk               int,
    web_site_id               string,
    web_rec_start_date        string,
    web_rec_end_date          string,
    web_name                  string,
    web_open_date_sk          int,
    web_close_date_sk         int,
    web_class                 string,
    web_manager               string,
    web_mkt_id                int,
    web_mkt_class             string,
    web_mkt_desc              string,
    web_market_manager        string,
    web_company_id            int,
    web_company_name          string,
    web_street_number         string,
    web_street_name           string,
    web_street_type           string,
    web_suite_number          string,
    web_city                  string,
    web_county                string,
    web_state                 string,
    web_zip                   string,
    web_country               string,
    web_gmt_offset            double,
    web_tax_percentage        double
) using csv options(header "false", delimiter "|", path "${path}/${name}.dat");
drop table if exists web_site;
create table web_site using parquet location '${path}/${name}/parquet' as (select * from web_site_tmp);
drop table if exists web_site_tmp;