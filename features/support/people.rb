require 'curb'
require 'excon'
require 'json'

class People
  def initialize(email = nil, name = nil, api_server = $API_SERVER)
    @id = nil
    @searchId = searchId
    @name = name
    @email = email
    @password = password
    @http = Backend_connection.new(api_server)
  end

  def list
    @http.path = "/users"
    @response = @http.get
    if isResponseValid(@response, 200, "Cannot list people")
      parseArray(@response.body)
      $LOGGER.info("Listed all users in system")
      return true
    else
      return false
    end
  end

  def parse(data)
    @hash = JSON.parse(data)
    @id = @hash['id'] if @hash['id'] != nil
  end

  def parseArray(data)
    @hash = JSON.parse(data)
    puts(@hash)
  end

  attr_accessor :email, :password
end