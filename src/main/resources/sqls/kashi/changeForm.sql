//换表记录查询
//operator:操作员姓名，network:营业网点，startDate:开始日期,endDate：结束日期
//return表清零次数:clearingzero 换表次数:changingzero 换表金额:changmeterfee 无表费次数:notablefee 总金额:totalamount
 select round(isnull(sum(h.c),0),2) clearingzero ,round(isnull(SUM(a.u),0),2) changingzero,
 		round(isnull(sum(a.changmeterfee),0),2) changmeterfee,round(isnull(SUM(n.n),0),2) notablefee,
 		round(isnull(sum(c.changmeterfee),0),2) totalamount 
 from (select SUM(f_changmeterfee) changmeterfee,id 
 	   from t_changmeter 
 	   where f_parentname4='{network}' and f_cmchangemeterdate  BETWEEN '{startDate} 00:00:00' 
             and '{endDate} 23:59:59' and f_cmoperator='{operator}'
 	   group by id) c
 left join (select COUNT(*) c,id 
 		    from t_changmeter 
 		    where f_replacewatchtype='表清零' and f_changmeterfee=0 
 		    group by id ) h
 on h.id=c.id
 left join (select COUNT(*) u,id,sum(f_changmeterfee) changmeterfee 
 		    from t_changmeter 
 		    where f_replacewatchtype='换新表' and f_payfeevalid='有效' 
 		    group by id) a 
 on a.id=c.id   
 left join (select COUNT(*) n,id 
 			from t_changmeter 
 			where f_replacewatchtype='换新表' and f_payfeevalid='有效' and f_changmeterfee=0 
 			group by id) n 
 on n.id=c.id