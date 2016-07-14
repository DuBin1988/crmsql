//有详细阶梯欠费用户
//userinfoid:用户信息id
//return:详见t_userfiles
select f_stair1price, f_stair1amount, f_stair1fee, f_stair2price, f_stair2amount,f_stair2fee, 
	   f_stair3price, f_stair3amount, f_stair3fee 
from (select min(u.f_stair1price) f_stair1price, SUM(isnull(h.f_stair1amount,0)) f_stair1amount,
		     SUM(isnull(h.f_stair1fee,0)) f_stair1fee,min(u.f_stair2price) f_stair2price,
		     SUM(isnull(h.f_stair2amount,0)) f_stair2amount, SUM(isnull(h.f_stair2fee,0)) f_stair2fee,
		     min(u.f_stair3price) f_stair3price, SUM(isnull(h.f_stair3amount,0)) f_stair3amount, 
		     SUM(isnull(h.f_stair3fee,0)) f_stair3fee 
	  from(select * 
		   from t_userfiles
		   where f_userinfoid='{userinfoid}') u 
		  left join 
		  (select * 
		   from t_handplan 
		   where shifoujiaofei='否' and f_state='已抄表' and lastrecord is not null) h 
		  on u.f_userid=h.f_userid) t