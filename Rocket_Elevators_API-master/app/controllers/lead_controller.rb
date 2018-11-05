class LeadController < ApplicationController
    require 'sendgrid-ruby'
    include SendGrid
    require 'zendesk_api'
    include ZendeskAPI

    def index 
    end

    def new_lead
        p = params["lead"].permit!
        puts "PARAMS = #{p}"
        file_attachment = p["file_attachment"] 
        if file_attachment != nil
            p["file_attachment"] = file_attachment.read
            file_attachment_text = "The Contact uploaded an attachment"
        else
            file_attachment_text = ""
        end
        lead = Lead.new(p)
        lead.valid?
        p lead.errors
        lead.save!
        
        #Creating zendesk ticket
        ZendeskAPI::Ticket.create!($client, :type => "question", :priority => "normal",
            :subject => "#{lead.full_name} from #{lead.company_name}",
            :comment => { :value => "The contact #{lead.full_name} from company #{lead.company_name} can be reached at email #{lead.email} and at phone number #{lead.phone}. #{lead.department} has a project named #{lead.project_name} which would require contribution from Rocket Elevators. \n \n #{lead.project_description} \n \n Attached Message: #{lead.message} \n \n #{file_attachment_text}" },
            :submitter_id => $client.current_user.id,
        )
      
        #Sending confirmation email
        data = JSON.parse("{
              \"personalizations\": [
                {
                  \"to\": [
                    {
                      \"email\": \"#{lead.email}\"
                    }
                  ],
                  \"dynamic_template_data\": {
                    \"subject\": \"Contact Request Confirmation\",
                    \"FullName\": \"#{lead.full_name}\",
                    \"ProjectName\": \"#{lead.project_name}\"
                  }
                }
              ],
              \"from\": {
                \"email\": \"contact@rocketelevators.ga\"
              },
              \"template_id\": \"d-e26cfed71c094feaaff6d3fcc2a962f3\"
            }")
            sg = SendGrid::API.new(api_key: ENV['sendgrid_key'])
            begin
                response = sg.client.mail._("send").post(request_body: data)
            rescue Exception => e
                puts e.message
            end  
    end
end