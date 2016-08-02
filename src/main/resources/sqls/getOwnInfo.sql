//有阶梯欠费用户
//userinfoid：用户信息id  h:t_handplan,u:t_userfiles
//return：欠费信息（gasFee）
select gasFee 
from (select SUM(isnull(h.f_stair2fee,0)+isnull(h.f_stair3fee,0)) gasFee 
      from (//返回指定表项目内容
      		select * 
			from t_userfiles 
			where f_userinfoid='{userinfoid}') u 
		   left join
		   (//根据对应条件返回项目内容
		    select * 
		    from t_handplan 
		    where shifoujiaofei='否' and f_state='已抄表' and lastrecord is not null) h 
		   on u.f_userid=h.f_userid) t
