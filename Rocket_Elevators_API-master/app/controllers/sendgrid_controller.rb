class SendgridController < ApplicationController
    require 'sendgrid-ruby'
    include SendGrid

    def index

        puts "Email sent"

        from = Email.new(email: 'test@example.com')
        to = Email.new(email: 'mathieu.houde@live.ca')
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['sendgrid_key'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers 
    end
end
