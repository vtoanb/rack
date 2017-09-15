require 'erb'

class Greeter
  def call(env)
    # [200, {}, ['Hello World']]
    # Rack::Response.new 'Hello World, 2017'
    Rack::Response.new(render('index.html.erb'))
  end

  def render(template)
    template_path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(template_path)).result(binding)
  end
end

