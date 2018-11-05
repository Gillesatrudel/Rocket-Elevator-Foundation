select concat(to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMonth'), ' ', extract(year from created_on)) as MonthYearStr, 
    count(*) as Nbcontact,
	concat(extract(year from created_on),' ', to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMM')) as YearMonthInt
from factcontact 
group by MonthYearStr, YearMonthInt
order by YearMonthInt;



