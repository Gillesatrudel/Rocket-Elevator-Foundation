
class QuoteController < ApplicationController
    require 'sendgrid-ruby'
    include SendGrid
    require 'zendesk_api'
    include ZendeskAPI

    def index 
    end

    def new_quote
        p = params["quote"].permit!
        puts "PARAMS = #{p}"
        quote = Quote.new(p)
        quote.valid?
        p quote.errors
        quote.save!
        
        if quote.quote_type == "residential"
            comment = { :value => "The contact #{quote.full_name} from company #{quote.business_name} can be reached at email #{quote.email}. \n \n He sent us the following quote request. \n \n The projects type is #{quote.quote_type} with #{quote.nb_apt} appartments, #{quote.nb_floors} floors and #{quote.nb_base} basements . \n \n The client chose the range #{quote.option} for his elevator project . " }
        elsif quote.quote_type == "commercial"
            comment = { :value => "The contact #{quote.full_name} from company #{quote.business_name} can be reached at email #{quote.email}. \n \n He sent us the following quote request. \n \n The projects type is #{quote.quote_type} and the client need #{quote.nb_shaft} elevators shaft into building of #{quote.nb_floors} floors, with #{quote.nb_cies} stores, #{quote.nb_base} basements, and #{quote.nb_parking} parkings . \n \n The client chose the range #{quote.option} for his elevator project . " }
        elsif quote.quote_type == "corporate"
            comment = { :value => "The contact #{quote.full_name} from company #{quote.business_name} can be reached at email #{quote.email}. \n \n He sent us the following quote request. \n \n The projects type is #{quote.quote_type} with #{quote.nb_corp} corporations, #{quote.nb_floors} floors, #{quote.nb_base} basements, with a maximum of occupancy #{quote.nb_person} per floor and #{quote.nb_parking} parkings . \n \n The client chose the range #{quote.option} for his elevator project. " }     
        elsif quote.quote_type == "hybrid"   
            comment = { :value => "The contact #{quote.full_name} from company #{quote.business_name} can be reached at email #{quote.email}. \n \n He sent us the following quote request. \n \n The projects type is #{quote.quote_type} with #{quote.nb_cies} companies, #{quote.nb_floors} floors, #{quote.nb_base} basements, with a maximum of occupancy #{quote.nb_person} and #{quote.nb_parking} parkings . \n \n The client chose the range #{quote.option} for his elevator project. " }
        end
        
        ZendeskAPI::Ticket.create!($client, :type => "task", :priority => "urgent",
            :subject => "#{quote.full_name} from #{quote.business_name}",
            :comment => comment,    
            :submitter_id => $client.current_user.token
        )
        
        
    end

end







