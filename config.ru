require './lib/greeter.rb'

use Rack::Reloader # Automatic reload rack when source file changed

run Greeter

# run Rack::Cascade.new [Rack::File.new('public'), Greeter]
