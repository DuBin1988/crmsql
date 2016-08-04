//根据ID查询收费记录
//id:收费id,orderitem:需要排序的字段
//return：用户编号(f_userid)  收费日期(f_deliverydate) 收费员(f_sgoperator) 网点(f_sgnetwork) 
//         收费金额(f_preamount)  收费气量(f_cumulativepurchase) 实收(f_grossproceeds) 应收(f_totalcost)  
//         滞纳金(f_zhinajin) 维护费(f_feiweihufei)
select f_userid,f_deliverydate,f_sgoperator,f_sgnetwork,f_preamount,f_cumulativepurchase,f_grossproceeds,
	   f_totalcost,f_zhinajin,f_feiweihufei 
from t_sellinggas 
where id ='{id}'
order by {orderitem}