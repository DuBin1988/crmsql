//抄表信息汇总  
//condition:查询条件
//return:气价类型，单价，户数，气量，金额
select f_stairtype,f_stair1price,COUNT(*) c,sum (oughtamount) oughtamount,SUM(oughtfee) oughtfee
from t_handplan
where {condition}
group by f_stairtype,f_stair1price