class Customer < ApplicationRecord

  belongs_to :user
  belongs_to :address
  has_many :buildings
  belongs_to :lead, optional: true

  after_save :new_customer

  rails_admin do
    edit do
      exclude_fields :buildings
    end
  end
  def name
    "#{self.business_name}"
  end
  def create_dropbox_folder
   
    client = DropboxApi::Client.new("Dropbox_api_token")
    all = client.list_folder("")
    
    folders = all.entries.select{ |dropbox_object| dropbox_object.is_a?(DropboxApi::Metadata::Folder)}

    folders_name = folders.collect{ |e| e.name }

    folders_name
  end

  def new_customer
    
    if self.lead and self.lead.file_attachment
      
      client = DropboxApi::Client.new("FdbTdqjEfVAAAAAAAAAAF46lv8xD7IpMxQXp8Q99GTTIYI8AVLBN0B7yLQqRkkag")

      client.upload("/#{self.id}_#{self.contact_full_name}", self.lead.file_attachment)

    end


  end
   
end 
  
