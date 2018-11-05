class Column < ApplicationRecord
  
  require'slack-ruby-client'
  
  belongs_to :battery
  has_many :elevators
  rails_admin do
    edit do
      exclude_fields :elevator
    end
  end

  validate :column_status
  
  def building_type_enum
    [['Residential', 0],['Commercial',1],['Corporate',2],['Hybrid',3]]
  end
  
  def status_enum
    [['Active', 'active'], ['Inactive','inactive'], ['Alarm','alarm'], ['Intervention','intervention']]
  end
  # send slack messages
  def column_status
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end

    slackclient = Slack::Web::Client.new
    
    if self.changed? then
      slackclient.chat_postMessage(
        channel: 'elevator_operations',
        text: "The column #{self.id} in the #{self.battery.building.building_name} changed status from #{self.changes['status'][0]} to #{self.status}. #{Time.now.utc}",
        as_user: false)
    end
  end
end

