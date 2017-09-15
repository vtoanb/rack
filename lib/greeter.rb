require 'erb'
require 'pry'

class Greeter
  # Basic Rack
  #  def call(env)
  #    # [200, {}, ['Hello World']]
  #    # Rack::Response.new 'Hello World, 2017'
  #    Rack::Response.new(render('index.html.erb'))
  #  end
  #
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when '/'
      render_response 'index.html.erb'
    when '/jobs'
      render_response 'jobs.html.erb'
    else
      Rack::Response.new 'Not found'
    end
  end

  def render(template)
    template_path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(template_path)).result(binding)
  end

  def render_response(template)
    template_path = File.expand_path("../views/#{template}", __FILE__)
    erb = ERB.new(File.read(template_path)).result(binding)
    Rack::Response.new erb
  end
end
