//查询欠费记录
//userinfoid:用户信息id
//return:参见t_userfiles
select h.f_userid, h.f_handdate, MIN(h.lastinputgasnum) lastinputgasnum, MAX(h.lastrecord) lastrecord, SUM(h.oughtamount) oughtamount,
	   min(h.f_stair1price) f_stair1price, SUM(h.f_stair1amount) f_stair1amount, SUM(h.f_stair1fee) f_stair1fee,
	   min(h.f_stair2price) f_stair2price, SUM(h.f_stair2amount) f_stair2amount, SUM(h.f_stair2fee) f_stair2fee,
	   min(h.f_stair3price) f_stair3price, SUM(h.f_stair3amount) f_stair3amount, SUM(h.f_stair3fee) f_stair3fee,
	   SUM(h.oughtfee) oughtfee, 0 f_zhinajin
from t_handplan h 
left join t_userfiles u 
on u.f_userid=h.f_userid 
where u.f_userinfoid='{userinfoid}' and h.shifoujiaofei='否' and h.f_state='已抄表' and h.lastrecord is not null 
group by h.f_userid, h.f_handdate
order by h.f_userid, h.f_handdate