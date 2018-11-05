require 'dropbox_api'

DropboxApi::Client.new("Dropbox_api_token")

client = DropboxApi::Client.new("Dropbox_api_token")
#=> #<DropboxApi::Client ...>
File.open("large_file.avi") do |f|
  client.upload_by_chunks "/remote_path.txt", f
end

