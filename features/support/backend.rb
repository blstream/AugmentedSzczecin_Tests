require 'curb'
require 'excon'
require 'json'
require "base64"

class Backend_connection
  def initialize(api_server)
    @api_server = api_server
    @token = Base64.urlsafe_encode64('testowy@test.pl:12345678')
    @param = nil
    @path = nil

  end

  def post
    @http = Excon.new(@api_server+@path, :body => JSON.generate(@param), :headers => {'Content-Type' => 'application/json','Authorization' => 'Basic#{@token)'})
    @response = @http.post
    @response.body
    @response.status
    return @response
  end

  def get
    @http = Excon.new(@api_server+@path, :headers => {'Content-Type' => 'application/json', 'Authorization' => 'Basic#{@token)'})
    @response = @http.get
    @response.body
    @response.status
    return @response
  end

  def put
    @http = Excon.new(@api_server+@path, :body => JSON.generate(@param), :headers => {'Content-Type' => 'application/json','Authorization' => 'Basic#{@token)'})
    @response = @http.put
    @response.body
    @response.status
    return @response
  end
  
  def del
    @http = Excon.new(@api_server+@path)
    @response = @http.delete
    return @response
  end

  attr_accessor :api_server, :token, :path, :param, :http
end