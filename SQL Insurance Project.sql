use insurance_project;
select * from brokerage;
select * from fees;
select * from individual_budgets;
select * from invoice2;
select * from meeting;
select * from opportunity;

## 1.No of Invoice by Account Executive
select * from invoice2;

select account_Executive,count(*)as no_invoice from invoice2 group by 1; 

## 2.Yearly Meeting Count
select * from meeting;

select year(meeting_date),count(*) from meeting group by 1;

## 3.1cross sell by brokerage,fees,individual
select * from brokerage;
select * from individual_budgets;
select *from invoice2;


select
(select cross_sell_brokerage from brokerage limit 1)as Achieved,
(select invoice_cross from invoice2 limit 1)as Invoice,
(select sum(cross_sell_bugdet) from individual_budgets limit 1)as Target;

## 3.2 Renewal by brokerage,invoice,individual
Select
(select renewal_brokerage from brokerage limit 1)as Achieved,
(select invoice_renewal from invoice2 limit 1) as Invoice,
(select sum(renewal_budget) from individual_budgets limit 1)as Traget;

## 3.3 New by brokerage,invoice,individual
Select
(select New_Brokerage from brokerage limit 1)as Achieved,
(select invoice_new from invoice2 limit 1) as Invoice,
(select sum(new_budget) from individual_budgets limit 1)as Traget;

## 4.Stage funnel by revenue
select * from opportunity;

select stage,sum(revenue_amount)Total_revenue from opportunity group by 1;

## 5.No of meeting by Account Executive
select account_executive,count(*) meeting_count from meeting group by 1;

## 6.Total revenue and opportunity count by stage
select * from opportunity;

select stage,sum(revenue_amount)total_revenue,count(*)opportunity_count from opportunity group by 1;

## 7.Top open opportunity
select * from opportunity;

select opportunity_name,sum(revenue_amount)Total_revenue from opportunity group by 1 order by 2 desc limit 4; 

## 8.oppty product distribution
select * from opportunity;

select product_group,count(*) count_of_products from opportunity group by 1;







