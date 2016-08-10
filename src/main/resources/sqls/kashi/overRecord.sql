//查询超用记录
//operator:操作员姓名，network:营业网点，startDate:开始换表日期,endDate：结束日期
//return：c:超用次数，pregas：超用气量，preamount：超用金额
select COUNT(*) c, round(isnull(sum(f_pregas),0),2) pregas,round(isnull(sum(f_preamount),0),2) preamount 
from t_sellinggas
where f_sgnetwork='{network}' and f_deliverydate  BETWEEN '{startDate} 00:00:00' 
      and '{endDate} 23:59:59' and f_sgoperator='{operator}'