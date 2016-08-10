//补气查询
//营业网点:network,操作员:operator,开始时间:startDate,截止时间:endDate,orderitem:需要排序的字段，gasType:补气类型
//return:次数(c),补气量(f_cmaddgas)
select COUNT(*) c,SUM(f_cmaddgas) f_cmaddgas
from t_fillgas 
where f_addgastype = '{gasType}' and f_parentname5 = '{network}' and f_foperator = '{operator}' 
	  and f_fdate >= '{startDate}' and f_fdate <='{endDate}'
