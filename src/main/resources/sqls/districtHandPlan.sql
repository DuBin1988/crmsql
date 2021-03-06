//小区抄表统计，返回需求字段
//return:册号（f_books），总户数（alluser），实用户（users），本月用量（oughtamount），本月金额（oughtfee）  h:t_handplan(求实际用户相关信息),u:t_userfiles(求总用户数)
select h.f_books f_books,u.alluser alluser,h.users users,h.oughtamount oughtamount ,h.oughtfee oughtfee
from (//求实际用户相关信息
	  select f_books,COUNT(*) users,SUM(oughtamount) oughtamount,SUM(oughtfee) oughtfee
	  from t_handplan
	  group by f_books) h
	  join 
	  //求总用户数
	  (select f_books,COUNT(*) alluser
	   from  t_userfiles
	   group by f_books) u
	   on h.f_books=u.f_books
order by h.f_books