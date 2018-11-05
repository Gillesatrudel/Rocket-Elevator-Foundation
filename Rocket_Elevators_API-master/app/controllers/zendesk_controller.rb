require 'zendesk_api'
include ZendeskAPI
class ZendeskController < ApplicationController
    
    def create_ticket(lead)
        
        # ZendeskAPI::Ticket.new(client, :id => 1, :priority => "urgent") # doesn't actually send a request, must explicitly call #save!
        # ZendeskAPI::Ticket.create!($client, :subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => 2, :priority => "urgent")
        # ZendeskAPI::Ticket.find!(client, :id => 1)
        # ZendeskAPI::Ticket.destroy!(client, :id => 1)
        ZendeskAPI::Ticket.create!($client, :subject => "#{lead.full_name} from #{lead.company_name} for project #{lead.project_name}", :comment => { :value => "Hello" }, :submitter_id => 2, :priority => "Normal")

    end
end
