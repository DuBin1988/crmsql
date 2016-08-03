//补卡查询
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate
//return:补卡数(c),补卡金额(f_cardfees),处理卡次数(f_times)
select COUNT(*) c,SUM(f_cardfees) f_cardfees,count(f_times) f_times
from t_renewalcard 
where f_payfeevalid='有效' and f_parentname = '{network}' and f_rcoperator = '{operator}' 
	  and f_recoverycarddate >= '{startDate}' and f_recoverycarddate <='{endDate}'
