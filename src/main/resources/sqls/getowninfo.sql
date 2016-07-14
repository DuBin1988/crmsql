//有阶梯欠费用户
//userinfoid：用户信息id  17034982
//return：欠费信息（gasFee）
select gasFee 
from (select SUM(isnull(h.f_stair2fee,0)+isnull(h.f_stair3fee,0)) gasFee 
      from (select * 
			from t_userfiles 
			where f_userinfoid='{userinfoid}') u 
		   left join
		   (select * 
		    from t_handplan 
		    where shifoujiaofei='否' and f_state='已抄表' and lastrecord is not null) h 
		   on u.f_userid=h.f_userid) t
