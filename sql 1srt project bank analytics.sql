SELECT * FROM project.banking_analytics;


# Total Funded Amount 
select
       sum(loan_amount) as Total_loan_amount_funded
       from banking_analytics;
       

#total loans
select 
       count(*)as total_loans
       from banking_analytics;
       

#total collection
select
      sum(total_received_principal+total_fees+total_received_interest+recoveries+collection_recovery_fee)
      from banking_analytics;
      
      
#total interst
select
       sum(total_received_interest) as total_interest
       from banking_analytics;
       
       
# branch wise performance 
SELECT 
    Branch_Name,
    COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount,
    SUM(IFNULL(Total_Received_Principal, 0)) AS Total_Principal_Collected,
    SUM(IFNULL(Total_Received_Interest, 0)) AS Total_Interest_Collected,
    SUM(
        IFNULL(Total_Received_Principal, 0) +
        IFNULL(Total_Received_Interest, 0) +
        IFNULL(Total_Received_Late_Fee, 0) +
        IFNULL(Recoveries, 0) +
        IFNULL(Collection_Recovery_Fee, 0)
    ) AS Total_Collection
FROM 
    banking_analytics
GROUP BY 
    Branch_Name
ORDER BY 
    Total_Collection DESC;
    
    
    
    
#state wise loan
SELECT 
    State_Name,
    COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount
FROM 
    banking_analytics
GROUP BY 
    State_Name
ORDER BY 
    Total_Loan_Amount DESC;
    
    
    SELECT * FROM project.banking_analytics;
    
    
#relegion wise loan
select 
    religion,
    COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount
from 
     project.banking_analytics 
group by 
	  religion
order by
       total_loan_amount desc;
       
       
       
       
       
       SELECT * FROM project.banking_analytics;
       
       
       
       
#product group wise loan
select
       product_id,
       COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount
from 
    project.banking_analytics
group by
	product_id
order by
    total_loan_amount desc;
    
    
    
#disbursemennt trend
SELECT 
    DATE_FORMAT(Disbursement_Date, '%Y-%m') AS Month,
    COUNT(*) AS Total_Loans,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Disbursed_Amount
FROM 
    banking_analytics
WHERE 
    Disbursement_Date IS NOT NULL
GROUP BY 
    DATE_FORMAT(Disbursement_Date, '%Y-%m')
ORDER BY 
    Month;
    
    
    select * from project.banking_analytics;
    
    
#grade wise loan
select	
     grade,
     COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount
from
    banking_analytics
group by
    grade
order by 
    total_loan_amount desc;
    
    
    
    
#default loan count
select
      count(*) as default_loan_count
from 
     banking_analytics
where
     is_default_loan='y';
     
     
     
     
#Grade Wise loan
SELECT 
    Grade,
    COUNT(*) AS Total_Loans,
    SUM(IFNULL(Loan_Amount, 0)) AS Total_Loan_Amount,
    SUM(IFNULL(Funded_Amount, 0)) AS Total_Funded_Amount
FROM 
    banking_analytics
GROUP BY 
    Grade
ORDER BY 
    Total_Loan_Amount DESC;
    
    
    
select * from project.banking_analytics;

#default loan count

select
   count(*)as default_loan_count

from 
    banking_analytics
where
    is_default_loan='Y';
    
    
    
    
    #delinquent client count
select
     count(*)as delinquient_client
from 
    project.banking_analytics
where
     is_delinquent_loan='Y';
     



  # Delinquent Loan Rate
  SELECT 
    ROUND(
        (SUM(CASE WHEN LOWER(TRIM(Is_Delinquent_Loan)) = 'y' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS Delinquent_Loan_Rate_Percentage
FROM 
    banking_analytics;
    
    
    
    
    
    
    
    
    #Default loan rate
SELECT 
    ROUND(
        (SUM(CASE WHEN LOWER(TRIM(Is_Default_Loan)) = 'y' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS Default_Loan_Rate_Percentage
FROM 
    banking_analytics;
    
    
    
    
   select *from banking_analytics;
   
   
   
    #loan status wise loan
select
     loan_status,
     count(*) as loan_count
from
   banking_analytics
group by
   Loan_Status
order by
    loan_count desc;
    
    
    
    
    
    #Age group wise loan
select
     Age_Group,
     count(*)as loan_count
from 
     banking_analytics
group by
	Age_Group
order by
     loan_count desc;
     
     
     
     
     
#loan maturity
SELECT 
    Client_Id,
    Disbursement_Date,
    Term,
    DATE_ADD(Disbursement_Date, INTERVAL CAST(REPLACE(Term, ' months', '') AS UNSIGNED) MONTH) AS Maturity_Date
FROM 
    banking_analytics
WHERE 
    Disbursement_Date IS NOT NULL AND Term IS NOT NULL;
    
    
    
    
    
#no verified loans

select
   count(*) as not_verified_loan_count
from
    project.banking_analytics
where 
lower(trim(verification_status))!='verified';
      


     
     
     
     
     
	#
    


    




     
      
