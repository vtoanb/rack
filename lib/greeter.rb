require 'erb'

class Greeter
  # Basic Rack
  #  def call(env)
  #    # [200, {}, ['Hello World']]
  #    # Rack::Response.new 'Hello World, 2017'
  #    Rack::Response.new(render('index.html.erb'))
  #  end
  #
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/'
      response 'index.html.erb'
    when '/jobs'
      response 'jobs.html.erb'
    else
      Rack::Response.new 'Not found'
    end
  end

  def render(template)
    template_path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(template_path)).result(binding)
  end

  def response(template)
    template_path = File.expand_path("../views/#{template}", __FILE__)
    erb = ERB.new(File.read(template_path)).result(binding)
    Rack::Response.new erb
  end
end

