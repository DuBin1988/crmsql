//小区抄表统计，返回需求字段
//return:册号，总户数，实用户，本月用量，本月金额
select h.f_books f_books,u.alluser alluser,h.users users,h.oughtamount oughtamount ,h.oughtfee oughtfee
from (select f_books,COUNT(*) users,SUM(oughtamount) oughtamount,SUM(oughtfee) oughtfee
	  from t_handplan
	  group by f_books) h
	  join 
	  (select f_books,COUNT(*) alluser
	   from  t_userfiles
	   group by f_books) u
	   on h.f_books=u.f_books
order by h.f_books