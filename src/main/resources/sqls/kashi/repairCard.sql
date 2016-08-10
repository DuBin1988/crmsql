//补卡查询
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate,orderitem:需要排序的字段
//return:补卡数(c),补卡金额(f_cardfees)
select ISNULL(COUNT(*),0) c,ISNULL(SUM(f_cardfees),0) f_cardfees
from t_renewalcard 
where f_payfeevalid='有效' and f_parentname = '{network}' and f_rcoperator = '{operator}' 
	  and f_recoverycarddate >= '{startDate}' and f_recoverycarddate <='{endDate}'
