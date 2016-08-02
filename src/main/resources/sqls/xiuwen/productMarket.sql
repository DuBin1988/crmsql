//修文产销情况汇总
//startlastinputdate:抄表开始时间  endlastinputdate:抄表结束时间
//return 区域(city) 应抄 (shouldcopy) 实抄(copied) 未抄(notcopy) 抄表率(meterreadingrate) 往月转入的水费(transferwater) 往月转入的污水费(sewagewater) 本月应收的水费(chargeswater)
//       本月应收的污水费(receivablewater)  本月累计应收的水费(accumulatedwater) 本月累计应收的污水费(receivablesewagewater) 本月实收的水费(paidwater) 本月实收的污水费(paidreceivablewater)
 //       违约金(zhinajin) 合计(total) 收费率(ratecharge) 转入下月(nextmonth) 
select  t.city as city, count(convert(numeric(20,0),t.shouldcopy)) as shouldcopy, count(convert(numeric(20,0),t.copied)) as copied,
        count(convert(numeric(20,0),t.shouldcopy))-count(convert(numeric(20,0),t.copied)) as notcopy,
        CAST(CAST(count(convert(numeric(20,0),t.copied)) as decimal(18,2))/CAST(count(convert(numeric(20,0),t.shouldcopy)) as decimal(18,2))*100 as decimal(18,2)) 
	    as meterreadingrate,SUM(t.transferwater) as transferwater,SUM(t.sewagewater) as sewagewater,
	    SUM(t.chargeswater) as chargeswater,SUM(t.receivablewater) as receivablewater,(SUM(t.transferwater)+SUM(t.chargeswater)) as accumulatedwater ,
        (SUM(t.sewagewater)+SUM(t.receivablewater)) as receivablesewagewater ,SUM(t.paidwater) as paidwater, SUM(t.paidreceivablewater) as paidreceivablewater,
        SUM(t.zhinajin) as zhinajin,(SUM(t.paidwater)+SUM(t.paidreceivablewater)+SUM(t.zhinajin)) as total,
        CAST(CAST((SUM(convert(numeric(20,0),t.paidwater))+SUM(convert(numeric(20,0),t.paidreceivablewater))+SUM(convert(numeric(20,0),t.zhinajin))) as decimal
	    (18,2))/CAST((SUM(convert(numeric(20,0),t.transferwater))+SUM(convert(numeric(20,0),t.chargeswater))+SUM(convert(numeric(20,0),t.sewagewater))+
	    SUM(convert(numeric(20,0),t.receivablewater))) as decimal(18,2))*100 as decimal(18,2)) as ratecharge,
        ((SUM(t.transferwater)+SUM(t.chargeswater)+SUM(t.sewagewater)+SUM(t.receivablewater))-(SUM(t.paidwater)+SUM(t.paidreceivablewater)+SUM(t.zhinajin))) 
        as nextmonth
from(select h.f_city city, 0  shouldcopy,h.f_userid copied,a.oughtfee transferwater,a.extrazjfee sewagewater,h.oughtfee  chargeswater,h.extrazjfee receivablewater,
            s.f_preamount paidwater,s.f_fjamount paidreceivablewater,s.f_zhinajin zhinajin,h.scinputdate scinputdate
            from (select f_userid,oughtamount,f_city,f_sellid,oughtfee,extrazjfee,scinputdate 
            	  from t_handplan 
            	  where '{startlastinputdate} 00:00:00.000'<=lastinputdate and lastinputdate <='{endlastinputdate} 23:59:59.000') h 
            left join t_handplan a on h.scinputdate = a.scinputdate
            left join  t_sellinggas s on s.id=h.f_sellid
            UNION all
            select f_city city,f_userid shouldcopy ,0 copied,0 transferwater,0 sewagewater,0 chargeswater,0 receivablewater,
            	   0 paidwater,0 paidreceivablewater, 0 zhinajin,0 scinputdate 
            from t_userinfo) t
group by t.city