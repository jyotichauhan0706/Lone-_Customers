create database finance;
use finance;
select * from finance_1;
select * from finance_2;

#### KPI-1  Year wise Loan amount
select
    Years,
    sum(loan_amnt) as Loan_amount
from 
	finance_1
group by 
	Years
order by Years asc;


#### KPI-2   Grade and sub_grade wise revol_bal
(select grade,sub_grade,
sum(revol_bal) from finance_1 as f1
left join 
finance_2 as f2
on f1.id =f2.id 
group by grade,sub_grade
order by sub_grade asc)
union
(select grade,sub_grade,
sum(revol_bal) from finance_1 as f1
right join 
finance_2 as f2
on f1.id =f2.id 
group by grade,sub_grade
order by sub_grade asc);


#### KPI-3   verification status wise Total Payment
select
verification_status,
count(verification_status) No_of_status,
round(sum(f2.total_pymnt),2) as Total_Payment from finance_1 as f1
join finance_2 as f2
on f1.id = f2.id
group by verification_status;


#### KPI-4   State and month wise loan status
select
addr_state, months,
count(loan_status) as Loan_Status
from finance_1
group by
addr_state,months
order by
addr_state asc;


#### KPI-5   Home ownership wise last payment date
(select home_ownership,
count(last_pymnt_d) from finance_1 as f1
left join 
finance_2 as f2
on f1.id =f2.id 
group by home_ownership)

union
(select home_ownership,
count(last_pymnt_d)  from finance_1 as f1
right join 
finance_2 as f2
on f1.id =f2.id 
group by home_ownership);



