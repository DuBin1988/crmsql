//抄表信息汇总  
//condition:查询条件
//return:气价类型（f_stairtype），单价（f_stair1price），户数（c），气量（oughtamount），金额（oughtfee）
select f_stairtype,f_stair1price,COUNT(*) c,sum (oughtamount) oughtamount,SUM(oughtfee) oughtfee
from t_handplan
where {condition}
group by f_stairtype,f_stair1price