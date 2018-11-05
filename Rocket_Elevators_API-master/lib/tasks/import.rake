
require 'csv'

namespace :import do 
  desc "Import users from csv"


  
  task users: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE users")
    filename = File.join Rails.root, "UserList.csv"

    CSV.foreach(filename, headers: true) do |row|
        user = User.create!(email: row["Email"], first_name: row["First name"],last_name: row["Last name"], title: row["Title"],created_at: row["Created at"], password: "test1234")
    end
  end

  task addresses: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE addresses")
    filename = File.join Rails.root, "Addresses.csv"

    CSV.foreach(filename, headers: true) do |row|
        address = Address.create!(address_type: row["Address Type"], status: row["Status"], entity: row["Entity"], street_address: row["StreetAddress"], suite_or_apt: row["Suite or App"], city: row["City"], state: row["State"], zip_code: row["ZipCode"], created_at: row["Created At"], updated_at: row["Updated At"], country: row["Country"], notes: row["Notes"])
    end
  end

  task customers: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE customers")
    filename = File.join Rails.root, "customers.csv"

    CSV.foreach(filename, headers: true) do |row|
        user = User.where(email: row["ContactEmail"]).first
        address = Address.where(street_address: row["StreetAddress"]).first
        customer = Customer.create!(user_id: user.id, business_name: row["BusinessName"], address_id: address.id, contact_full_name: row["ContactName"], contact_phone: row["ContactTelephone"], contact_email: row["ContactEmail"], business_description: row["CompanyDescription"], technician_full_name: row["TechnicianName"], technician_phone: row["TechnicianTelephone"], technician_email: row["TechnicianEmail"], created_at: row["Created At"], updated_at: row["Updated At"])
    end
  end

  task employees: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE employees")
    filename = File.join Rails.root, "Employees.csv"

    CSV.foreach(filename, headers: true) do |row|
        user = User.where(email: row["Email"]).first
        employee = Employee.create!(user_id: user.id, first_name: row["First name"], last_name: row["Last name"], email: row["Email"], title: row["Title"],  created_at: row["Created At"], updated_at: row["Updated At"], phone: row["Phone"])
    end
  end


  task buildings: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE buildings") 
    filename = File.join Rails.root, "buildings.csv"

    CSV.foreach(filename, headers: true) do |row|
        customerID = Customer.order('RAND()').first.id
        address = Address.where(street_address: row["StreetAddress"]).first
        building = Building.create!(customer_id: customerID, address_id: address.id, administrator_full_name: row["Adm Name"], administrator_phone: row["Adm Phone"], administrator_email: row["Adm Email"], technician_full_name: row["TechnicianName"], technician_phone: row["Technician Phone"], technician_email: row["TechnicianEmail"], created_at: row["Created At"], updated_at: row["Updated At"], building_name: row["Building Name"])
    end
  end

  task batteries: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE batteries")
    filename = File.join Rails.root, "Batteries.csv"
    CSV.foreach(filename, headers: true) do |row|
        buildingID = Building.order('RAND()').first.id
        EmployeeID = Employee.order('RAND()').first.id
        battery = Battery.create!(building_id: buildingID, building_type: row["Building Type"], status: row["Status"], employee_id: EmployeeID, in_service_since: row["In Service Since"], last_inspection: row["Last Inspection"], operations_certificate: row["Operation Certificate"], information: row["Information"],notes: row["Notes"], created_at: row["Created At"], updated_at: row["Updated At"])
    end
  end

  task columns: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE columns") 
    filename = File.join Rails.root, "Columns.csv"

    CSV.foreach(filename, headers: true) do |row|
        battery = Battery.order('RAND()').first
        column = Column.create!(battery_id: battery.id, building_type: battery.building_type, floors_served: row["Floors Served"], status: row["Status"], information: row["Information"],notes: row["Notes"], created_at: row["Created At"], updated_at: row["Updated At"])
    end
  end

  task elevators: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE elevators")
    filename = File.join Rails.root, "Elevators.csv"

    CSV.foreach(filename, headers: true) do |row|
        column = Column.order('RAND()').first
        elevator = Elevator.create!(column_id: column.id, serial_number: row["Serial Number"], model: row["Model"], building_type: column.building_type, status: row["Status"], in_service_since: row["In Service Since"], last_inspection: row["Last Inspection"], inspection_certificate: row["Inspection Certificate"], information: row["Information"],notes: row["Notes"], created_at: row["Created At"], updated_at: row["Updated At"])
    end
  end


  task buildingDetails: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE building_details") 
    filename = File.join Rails.root, "Building_Details.csv"

    CSV.foreach(filename, headers: true) do |row|
        detail = BuildingDetail.create!(building_id: row["Id"], information_key: row["Information key"], value: row["Value"])
    end
  end

  task leads: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE leads") 
    filename = File.join Rails.root, "LeadList.csv"

    CSV.foreach(filename, headers: true) do |row|
      puts row
        lead = Lead.create!(full_name: row["Full name"], company_name: row["Company name"], email: row["Email"], phone: row["Phone"], project_name: row["Project name"], department: row["Department"], created_at: row["Created at"], updated_at: row["Updated at"])
    end
  end

  task quotes: :environment do
    ActiveRecord::Base.connection.execute('SET FOREIGN_KEY_CHECKS=0;')
    ActiveRecord::Base.connection.execute("TRUNCATE quotes") 
    filename = File.join Rails.root, "Quotes.csv"

    CSV.foreach(filename, headers: true) do |row|
        quote = Quote.create!(quote_type: row["Quote type"], full_name: row["Full name"], business_name: row["Business name"], email: row["Email"], nb_floors: row["Nb floors"], nb_apt: row["Nb apt"], nb_base: row["Nb base"], nb_cies: row["Nb cies"], nb_parking: row["Nb parking"], nb_shaft: row["Nb shaft"], nb_corp: row["Nb corp"], nb_person: row["Nb person"], req_elev: row["Req elev"], option: row["Option"], nb_elev: row["Nb elev"], price_per_elev: row["Price per elev"], elev_total: row["Elev total"], cost_install: row["Cost install"], total: row["Total"], created_at: row["Created at"], updated_at: row["Updated at"])
    end
  end

end

