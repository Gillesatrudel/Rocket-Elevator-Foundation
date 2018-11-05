class ChartsController < ApplicationController
    before_action :authenticate_user!
    def chart
        conn = PG::Connection.open( host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "jp", password: "jp123", dbname: "jp")
        @data1 = conn.exec("select concat(to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMonth'), ' ', extract(year from created_on)) as MonthYearStr, count(*) as Nbcontact, concat(extract(year from created_on),' ', to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMM')) as YearMonthInt from factcontact group by MonthYearStr, YearMonthInt order by YearMonthInt;") 
        @x1 = @data1.column_values(0)
        @y1 = @data1.column_values(1)

        @data2 = conn.exec("select concat(to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMonth'), ' ', extract(year from created_on)) as MonthYearStr, count(*) as NbQuotes, concat(extract(year from created_on),' ', to_char(to_timestamp (extract(month from created_on)::text, 'MM'), 'TMMM')) as YearMonthInt from factquotes group by MonthYearStr, YearMonthInt order by YearMonthInt;") 
        @x2 = @data2.column_values(0)
        @y2 = @data2.column_values(1)

        @data3 = conn.exec("SELECT business_name, nb_elevators FROM dimcustomers where nb_elevators > 0 GROUP BY business_name, nb_elevators order by nb_elevators;") 
        @x3 = @data3.column_values(0)
        @y3 = @data3.column_values(1)
    end

end
