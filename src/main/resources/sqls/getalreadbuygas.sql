//获取缴费总气量
//userid:用户id，deliverdate:日期
//return:总气量（totalGas）
select  isnull(sum(f_pregas),0) totalGas 
from t_sellinggas 
where f_userid ='{userid}' and f_deliverydate>'{deliverdate}' and f_payfeevalid='有效'