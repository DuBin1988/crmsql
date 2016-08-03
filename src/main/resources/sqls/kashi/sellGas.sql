//售气查询
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate
//return:充值类型(f_gasmeterstyle),用气类型(f_gasproperties),阶梯类型(f_stairtype),笔数(c),气量(f_pregas),金额(f_preamount)
select f_gasmeterstyle,f_gasproperties,f_stairtype,count(*) c,round(sum(f_pregas),2) f_pregas,round(SUM(f_preamount),2) f_preamount
from t_sellinggas
where f_payfeevalid<>'无效' and f_sgnetwork = '{network}' and f_sgoperator = '{operator}' 
	  and f_deliverydate >= '{startDate}' and f_deliverydate <='{endDate}'
group by f_gasmeterstyle,f_gasproperties,f_stairtype