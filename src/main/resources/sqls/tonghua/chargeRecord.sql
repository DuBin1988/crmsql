//查询缴费记录详细
//condition:查询条件,orderitem:需要排序的字段
//抄表日期:  books 册号,username 用户姓名,userid 用户编号,address 用户地址,lastinputgasnum 上月表数,
//        oughtamount 累计气量,stair1price 阶段一单价,gaspricetype 气价类型,zhye 上次账户余额,
//        endjfdate 交费截止日期,inputtor 抄表员
select h.f_books books,h.f_username username,h.f_userid userid,h.f_address f_address,h.lastinputgasnum lastinputgasnum,
       t.oughtamount oughtamount,h.f_stair1price stair1price,h.f_gaspricetype gaspricetype,h.f_zhye zhye,
       substring(convert(varchar(10),DATEADD(MONTH,1,GETDATE()),120),0,8)+'-15' endjfdate,f_inputtor inputtor 
from (select * from t_handplan where {condition}) h
left join (select id,sum(oughtamount) oughtamount  
           from t_handplan 
           where f_stardate <=lastinputdate and lastinputdate<=getdate() 
           GROUP BY id) t 
on t.id = h.id
order by {orderitem}