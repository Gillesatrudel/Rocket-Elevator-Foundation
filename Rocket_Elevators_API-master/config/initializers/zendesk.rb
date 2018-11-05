$client = ZendeskAPI::Client.new do |config|
    # Mandatory:
  
    config.url = "https://rocketelevators.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
  
    # Basic / Token Authentication
    config.username = "larouche_33@hotmail.com" 
    #"login.email@zendesk.com"
    

   # Choose one of the following depending on your authentication choice
    config.token = ENV['ZENDESK_API_KEY']
    #"your zendesk token"
    # config.password = ""
    #"your zendesk password"
  
    # OAuth Authentication
     # config.access_token = "9e0a4d960a994d5de72beb57bb40851dd5773e62dd7dea60e758f74a81e09b4a"
     # set = oauth:false
     # curl -u larouche_33@.com/token:l0I2qOVOJGYxH4vu1tsVXCgihIRg5sF8ErnQ4O0h https://rocketelevators.zendesk.com/api/v2
     # curl -u email@domain.com/token:kX53RIXZKUFhZxSYhRxe7QGFocTkDmmERDxpcddF https://...
  
    # Optional:
  
    # Retry uses middleware to notify the user
    # when hitting the rate limit, sleep automatically,
    # then retry the request.
    config.retry = true
  
    # Logger prints to STDERR by default, to e.g. print to stdout:
    require 'logger'
    config.logger = Logger.new(STDOUT)
  
    # Changes Faraday adapter
    #config.adapter = :patron
  
    # Merged with the default client options hash
    # config.client_options = { :ssl => false }
  
    # When getting the error 'hostname does not match the server certificate'
    # use the API at https://yoursubdomain.zendesk.com/api/v2
end