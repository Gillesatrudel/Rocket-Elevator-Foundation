class Elevator < ApplicationRecord
  
  require 'twilio-ruby'
  require'slack-ruby-client'
  
  validate :elevator_status

  def model_enum
    [['Standard', 0], ['Premium', 1], ['Excelium', 2]]
  end
  def status_enum
    [['Active', 'active'], ['Inactive', 'inactive'], ['Alarm', 'alarm'], ['Intervention', 'intervention']]
  end

  def building_type_enum
    [['Residential', 0], ['Commercial', 1], ['Corporate', 2], ['Hybrid', 3]]
  end
  

  # Send text and slack messages
  def elevator_status
    client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"])

    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end

    # Send texts via twilio
    if self.status_was != self.status and self.status == 'intervention' then
      client.messages.create(
        from: "+13473703502",
        to: self.column.battery.building.technician_phone,
        body: "The elevator #{self.id} with Serial Number #{self.serial_number} in the #{self.column.battery.building.building_name} building changed status from #{self.changes['status'][0]} to #{self.status}.")
    end

    sclient = Slack::Web::Client.new
    
    # Send slack messages
    if self.changed? then
    sclient.chat_postMessage(
      channel: 'elevator_operations',
      text: "The elevator #{self.id} with Serial Number #{self.serial_number} in the #{self.column.battery.building.building_name} changed status from #{self.changes['status'][0]} to #{self.status}. #{Time.now.utc}",
      as_user: false)
    end
  end
  belongs_to :column
end

