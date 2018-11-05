#require  'net/http'
#require 'uri'

class WatsonController < ApplicationController

    def index 
        require  'net/http'
        require 'uri'
        uri = URI.parse("https://stream.watsonplatform.net/authorization/api/v1/token?url=https://stream.watsonplatform.net/text-to-speech/api")
        request = Net::HTTP::Get.new(uri)
        request.basic_auth(ENV['WATSON_USER'], ENV['WATSON_PASSWORD'])
        req_options = {
          use_ssl: uri.scheme == "https",
        }
        
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
        
        elevator = Elevator.count
        building = Building.count
        customer = Customer.count
        user = current_user
        username = user.name
        elevator_down = Elevator.where(:status => "intervention").count
        quote = Quote.count 
        lead = Lead.count
        battery = Battery.count
        city = Address.where(:entity => "Building").distinct.count(:city)
        



        

        p response.body
        token = response.body
        voice = "en-US_AllisonVoice"
        text = "Greetings to the logged #{username}, there are currently #{elevator} elevators deployed in the #{building} buildings of your #{customer} customers. Currently, #{elevator_down} elevators are not in Running Status and are being serviced. You currently have #{quote} quotes awaiting processing, You currently have #{lead} leads in your contact requests, #{battery} Batteries are deployed across #{city} cities"
        render :json => {text: text, token: token, voice: voice}


    end


    


end
