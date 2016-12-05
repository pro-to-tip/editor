require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get '/' do
 slim <<EOF
    doctype html
    html
      head 

      <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />


  
       
       <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

 
        title -

        body style="margin: 0; overflow:auto;"
       
      
         iframe src="index.html" style="position: absolute; border: 0; width: 100%; height: 100%;" #{HIDDEN_SERVICE.hostname}
        
         
         
           
EOF
 
end
run Sinatra::Application
