//查询欠费记录
//userinfoid:用户信息id
//return:用户编号(h.f_userid),抄表时间(h.f_handdate),上次抄表最小底数(lastinputgasnum),本次抄表最大底数(lastrecord)
         阶段一最小单价(f_stair1price),阶段一总气量(f_stair1amount),阶段一总金额(f_stair1fee,)
         阶段二最小单价(f_stair2price),阶段二总气量(f_stair2amount),阶段二总金额(f_stair2fee)
         阶段三最小单价(f_stair3price),阶段三总气量(f_stair3amount),阶段三总金额(f_stair3fee)
         应交总金额(oughtfee),滞纳金(f_zhinajin),应交总气量(oughtamount)
         h:t_handplan,u:t_userfiles
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