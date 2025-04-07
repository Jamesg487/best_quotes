require './config/application'

use Rack::Auth::Basic, "app" do |_, pass|
  'secret' == pass
end
run proc { [200, {'Content-Type' => 'text/html'}, ["Hello, world!"]] }