//查询收费记录
//抄表日期:(lastinputdate),本月指数:(lastrecord), 用量:(oughtamount), 应收金额:(oughtfee), 本次缴费:(grossproceeds), 
  余额:(zhye), 滞纳金:(zhinajin), 缴费日期:(deliverydate) h-(t_handplan),s-(t_sellinggas) 
select SUBSTRING(CONVERT(VARCHAR(10),h.lastinputdate,120),0,8) lastinputdate,sum(h.lastrecord) lastrecord,
	   sum(h.oughtamount) oughtamount,round(SUM(oughtfee),2) oughtfee,sum(f_grossproceeds) grossproceeds, 
	   sum(zhye) zhye ,sum(h.f_zhinajin) zhinajin,s.f_deliverydate deliverydate
from t_handplan h 
left join t_sellinggas s 
on h.f_sellid = s.id
where {condition}
group by SUBSTRING(CONVERT(VARCHAR(10),h.lastinputdate,120),0,8),s.f_deliverydate
order by {orderitem}