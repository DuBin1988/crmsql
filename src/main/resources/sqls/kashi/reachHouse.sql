//过户记录查询
//operator:操作员姓名，network:营业网点，startDate:开始换表日期,endDate：结束日期
//return：过户数(c),过户金额(transferfee),免费过户次数(noc)      
select round(isnull(SUM(t.c),0),2) c,round(isnull(SUM(t.f_transferfee),0),2) transferfee,round(isnull(SUM(r.noc),0),2) noc
from (select id,COUNT(*) c,f_transferfee
      from t_transfer 
      where f_toperator='{operator}' and f_tdate BETWEEN '{startDate} 00:00:00' 
            and '{endDate} 23:59:59' and f_departments ='{network}' 
      GROUP BY id,f_transferfee ) t 
      left join 
      (select id,COUNT(*) noc 
       from t_transfer 
       where f_transferfee is null 
       GROUP BY id ) r 
      on r.id=t.id