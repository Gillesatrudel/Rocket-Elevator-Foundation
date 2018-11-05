require 'smtpapi'

class LeadConfirmationMailer < ApplicationMailer
    default :from => 'contact@rocketelevators.ga'

    def contact_us_confirmation(full_name, project_name, email)
        headers "X-SMTPAPI" => {
            sub: {
            "%FullName%" => [full_name],
            "%ProjectName%" => [project_name]
            },
            filters: {
                templates: {
                    settings: {
                    enable: 1,
                    template_id: 'd-e26cfed71c094feaaff6d3fcc2a962f3'
                    }
                }
            }
        }.to_json

        puts headers
        
        # the 'to' email can be overridden per action
        mail(to: email, subject: "Contact request received!")
    end
end

