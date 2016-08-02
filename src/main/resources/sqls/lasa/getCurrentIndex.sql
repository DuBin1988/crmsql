//获取多个用户该时间点前的最后一条抄表记录的本期指数
//lastinputdate:抄表日期 h:t_handplan s:t_handplan(查询最后一条超波a记录)
//return:该时间点前的最后一条抄表记录
select h.* 
from t_handplan h 
join (select f_userid,MAX(lastinputdate) lastinputdate 
	  from t_handplan 
	  where lastinputdate<='{lastinputdate}'
      group by f_userid  ) s 
on h.f_userid=s.f_userid and h.lastinputdate=s.lastinputdate