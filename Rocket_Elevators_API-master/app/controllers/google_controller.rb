class GoogleController < ApplicationController
    before_action :authenticate_user!

    def google
        # look for the address in the db
        @marks = []

         buildings = Building.all
         buildings.each do |building|
            
            #initializing variables
            name = building.customer.business_name
            address = building.address
            b = building.batteries.count
            bat_ids = building.battery_ids
            c = Column.where(battery_id: bat_ids).count
            col_ids = Column.where(battery_id: building.battery_ids).ids
            e = Elevator.where(column_id: col_ids).count
            tech = building.technician_full_name
            
            ifloors = building.building_details.where("LOWER(information_key) like '%floor%'").first
            floors = ifloors ? ifloors.value : "Not available"
        
            # creating the object with all the addresses info
            lolilol = address.street_address + " " + address.city + " " + address.zip_code
            answer = JSON.parse(Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{lolilol.parameterize}&key=#{ENV['Google_API_KEY']}").body)
            #Extraire latitude et longitude de answer
            lat = answer["results"][0]["geometry"]["location"]["lat"]
            lng = answer["results"][0]["geometry"]["location"]["lng"]

            #Lists in an array the variables and the lats and lngs 
            @marks << {lat: lat, lng: lng,
                batteries: b,
                columns: c,
                name: name,
                elevators: e,
                tech_name: tech,
                address: lolilol,
                floors: floors}
        end



    end
end
