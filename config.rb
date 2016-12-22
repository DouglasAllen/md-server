# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

#
class Options < Hash
  attr_writer :options
end

status = 200
header = { 'Content-Type' => 'text/html' }
body   = ['hello world!']
response = [status,
            header,
            body]
# app = ->(e) { response }

options = Options.new
app = EotSite
options.store(:app, app)
options.store(:server, 'thin')
options.store(:Port, 9292)
options.store(:Host, '0.0.0.0')

Rack::Server.start options
