//机表欠费报表查询
//condition:查询条件
//return:用户编号（u.f_userid），用户姓名（u.f_username），地址（u.f_address），电话（u.f_phone），最新抄表指数（u.lastinputgasnum），
         抄表欠费（qf.je），账户余额（u.f_zhye），实际余额（actualamount），交费总额（sf.totalamount），欠费次数（qf.times），
		 欠费月份（months.f_date），抄表员（u.f_inputtor），最后购气日期（f_finabuygasdate）
		 u:t_userfiles,qf:t_handplan(查询欠费金额),sf:t_sellinggas(查询收费总金额),months:t_handplan(查询欠费月份)

select u.f_userid,u.f_username,u.f_address,u.f_phone,u.lastinputgasnum,qf.je,u.f_zhye,u.f_zhye-qf.je actualamount,
	   sf.totalamount,qf.times,months.f_date,u.f_inputtor,
	   substring(convert(varchar(50),u.f_finabuygasdate,120),1,10) f_finabuygasdate
from t_userfiles u
right join --欠费金额,次数
	(select SUM(oughtfee) je,f_userid ,COUNT(*) times 
	from t_handplan
	where f_state='已抄表' and shifoujiaofei='否'
	group by f_userid) qf
	on 	u.f_userid=qf.f_userid
left join --收费总金额
	(select f_userid,SUM(f_grossproceeds) totalamount 
	from t_sellinggas
	where f_payfeevalid='有效'
	group by f_userid) sf
	on qf.f_userid=sf.f_userid
left join --欠费月份
	(select distinct f_userid, convert(varchar(200),
		(select SUBSTRING(CONVERT(varchar(50),lastinputdate,120),1,7)+' , '
		from t_handplan a
		where a.shifoujiaofei='否' and a.f_state='已抄表' and a.f_userid=b.f_userid
		group by lastinputdate
		order by lastinputdate  
		for xml path(''))) as f_date
	from t_handplan b) months
	on qf.f_userid=months.f_userid
where {condition}
order by {orderitem}
