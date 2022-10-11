drop table if exists store_returns_tmp;
create table store_returns_tmp (
  sr_returned_date_sk integer, 
  sr_return_time_sk integer, 
  sr_item_sk integer, 
  sr_customer_sk integer, 
  sr_cdemo_sk integer, 
  sr_hdemo_sk integer, 
  sr_addr_sk integer, 
  sr_store_sk integer, 
  sr_reason_sk integer, 
  sr_ticket_number integer, 
  sr_return_quantity integer, 
  sr_return_amt decimal(7, 2), 
  sr_return_tax decimal(7, 2), 
  sr_return_amt_inc_tax decimal(7, 2), 
  sr_fee decimal(7, 2), 
  sr_return_ship_cost decimal(7, 2), 
  sr_refunded_cash decimal(7, 2), 
  sr_reversed_charge decimal(7, 2), 
  sr_store_credit decimal(7, 2), 
  sr_net_loss decimal(7, 2)
) using csv options(header "false", delimiter "|", path "${path}/${name}");
drop table if exists store_returns;
create table store_returns using parquet as (select * from store_returns_tmp);
drop table if exists store_returns_tmp;