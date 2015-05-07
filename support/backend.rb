require 'curb'
require 'excon'
require 'json'

class Backend_connection
  def initialize(api_server)
    @api_server = api_server
    @token = nil
    @param = nil
    @path = nil
  end

  def post
    @http = Excon.new(@api_server+@path, :body => JSON.generate(@param), :headers => {'Content-Type' => 'application/json'})
    @response = @http.post
    @response.body
    return @response
  end

  def del
    @http = Excon.new(@api_server+@path)
    @response = @http.delete
    return @response
  end

  attr_accessor :api_server, :token, :path, :param, :http
end