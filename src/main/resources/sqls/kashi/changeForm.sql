//换表记录查询
//operator:操作员姓名，network:营业网点，startDate:开始日期,endDate：结束日期
//return： 换表次数(c)，换表金额(watchfee)，无表费次数(noc) 
select round(isnull(SUM(c.c),0),2) c,round(isnull(SUM(c.f_watchfee),0),2) watchfee, round(isnull(SUM(a.noc),0),2) noc    
from (select id,COUNT(*) c,f_watchfee  
      from t_changmeter 
      where f_parentname4='{network}' and f_cmchangemeterdate  BETWEEN '{startDate} 00:00:00' 
            and '{endDate} 23:59:59' and f_cmoperator='{operator}' 
            GROUP BY id,f_watchfee) c 
     left join 
     (select id,COUNT(*) noc 
      from t_changmeter  
      where f_watchfee is null 
      GROUP BY id) a 
     on c.id=a.id