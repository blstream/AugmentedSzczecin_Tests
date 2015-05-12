require 'curb'
require 'excon'
require 'json'
require "base64"

class Backend_connection
  def initialize(api_server)
    @api_server = api_server
    @token = nil
    @param = nil
    @path = nil
    @auth = nil
    @user = 'some_mail+5@gmail.com'
    @password = '12341234'
  end

  def post
    @auth = Base64.urlsafe_encode64("#{@user} #{@password}")
    @http = Excon.new(@api_server+@path, :body => JSON.generate(@param), :headers => {'Content-Type' => 'application/json','Authorization' => @auth})
    @response = @http.post
    @response.body
    return @response
  end

  def get
    @auth = Base64.urlsafe_encode64("#{@user} #{@password}")
    @http = Excon.new(@api_server+@path, :headers => {'Content-Type' => 'application/json', 'Authorization' => @auth})
    @response = @http.get
    @response.body
    return @response
  end

  def put
    @auth = Base64.urlsafe_encode64("#{@user} #{@password}")
    @http = Excon.new(@api_server+@path, :body => JSON.generate(@param), :headers => {'Content-Type' => 'application/json','Authorization' => @auth})
    @response = @http.put
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