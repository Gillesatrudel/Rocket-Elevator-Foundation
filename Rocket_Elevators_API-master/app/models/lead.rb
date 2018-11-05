class Lead < ApplicationRecord 
  has_one :customer
  
  def list_of_folders_dropbox
   client = DropboxApi::Client.new("#{ENV["Dropbox_api_token"]}")
   list_folder_result = client.list_folder('')
   entries = list_folder_result.entries

   folders = entries.select{|e| e.is_a?(DropboxApi::Metadata::Folder)}
   folders.collect!{|f_met| f_met.name}
   puts folders
  end
  
  def dropbox_add_file
    list_folders = self.list_of_folders_dropbox
    name = "#{self.customer.business_name} #{self.customer.id}"

    validation = false
    
    list_folders.each do |toto|
    
      if toto == name
          validation = true
      end
    end

    if !validation
     self.dropbox_add_folder
    end

    puts "____________Before add folder_______________"

    client = DropboxApi::Client.new("#{ENV["Dropbox_token"]}")
    content = self.file_attachment
    business_name = "#{self.customer.business_name}"
    file_name = self.original_filename

    client.upload("/#{business_name}/#{file_name}", content)

    puts "____________attachment = nil_______________"
    tata = self
    tata.file_attachment = nil
    tata.save!  
    puts "____________attachment = nil end_______________"
  end

  def dropbox_add_folder

      client = DropboxApi::Client.new("#{ENV["Dropbox_api_token"]}")

      business_name = "#{self.customer.business_name} #{self.customer.id}"
      client.create_folder(business_name) 
  end

end
