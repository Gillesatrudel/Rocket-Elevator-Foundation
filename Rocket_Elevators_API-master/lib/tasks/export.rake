require 'pg'
namespace :export do
   desc "export to postgresql"
   task dwh: :environment do
    conn = PG::Connection.open( host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "jp", password: "jp123", dbname: "jp")
    conn.exec("TRUNCATE factquotes RESTART IDENTITY")    

    Quote.all.entries.each do |quote|
        #print quote
        conn.exec("INSERT INTO \"factquotes\" (quote_id, created_on, business_name, email, nb_elevators) VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.business_name}', '#{quote.email}', #{quote.nb_elev})")
    end
     

    conn.exec("TRUNCATE factcontact RESTART IDENTITY")    
    Lead.all.entries.each do |lead|
        # print lead
        conn.exec("INSERT INTO \"factcontact\" (contact_id, created_on, business_name, email, project_name) VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}')")
    end

    conn.exec("TRUNCATE factelevator RESTART IDENTITY")    
    Elevator.all.entries.each do |elevator|
        conn.exec("INSERT INTO \"factelevator\" (elevator_id, serial_number, in_service_since, building_id, customer_id, building_city) VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.in_service_since}', #{elevator.column.battery.building.id}, #{elevator.column.battery.building.customer.id}, '#{elevator.column.battery.building.address.city}')")
    end

    conn.exec("TRUNCATE dimcustomers RESTART IDENTITY")  
      
    Customer.all.entries.each do |customer|
        nb_elevators = 0
            customer.buildings.each do |building|
                building.batteries.each do |battery|
                    battery.columns.each do |column|
                    nb_elevators += column.elevators.size
                end
                end
            end
        sql = "INSERT INTO \"dimcustomers\" (id, created_on, business_name, contact_full_name, contact_email, nb_elevators, customer_city) VALUES (nextval('dimcustomers_id_seq'),'#{customer.created_at}', '#{customer.business_name}', '#{customer.contact_full_name}', '#{customer.contact_email}', #{nb_elevators}, '#{customer.address.city}')"
        puts sql
        conn.exec(sql)
    end

   end
end


