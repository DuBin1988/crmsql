//补卡处理卡次数统计
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate,orderitem:需要排序的字段
//return:处理卡次数(c)
select COUNT(*) c
from t_renewalcard 
where f_payfeevalid='有效' and f_cardfees = 0 and f_parentname = '{network}' and f_rcoperator = '{operator}' 
	  and f_recoverycarddate >= '{startDate}' and f_recoverycarddate <='{endDate}'
order by {orderitem}