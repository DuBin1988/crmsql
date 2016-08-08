//小区抄表统计总和 
//book:(区域号),totalzong:(总户数合计),totalyong:(实户数合计),totaloughtamount:(本月用量合计),totaloughtfee:(本月金额合计)
select SUBSTRING(f_books,0,5) book,COUNT(*) totalzong,sum(case when oughtamount>0 then 1 else 0 end)  
	   totalyong,SUM(oughtamount) totaloughtamount,round(SUM(oughtfee),2) totaloughtfee 
from t_handplan 
where {condition}
group by SUBSTRING(f_books,0,5)
order by {orderitem}
