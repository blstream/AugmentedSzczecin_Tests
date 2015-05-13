require 'curb'
require 'excon'
require 'json'

class User
  def initialize(email = nil, password = nil, searchId = nil, name = "Some User", api_server = $API_SERVER)
    @id = nil
    @name = name
    @email = email
    @password = password
    @searchId = searchId
    @http = Backend_connection.new(api_server)
  end

  def create
    @http.path = "/users"
    @http.param = {"email" => @email, "password"=> @password}
    @response = @http.post
    puts(@response.body)
    if isResponseValid(@response, 200, "Cannot create user #{@email}")
      parse(@response.body)
      $LOGGER.info("User #{@email} created.")
      return true   
    else
      return false
    end
  end

  def list
    @http.path = "/users"
    @response = @http.get
    if isResponseValid(@response, 200, "Cannot list users")
      parseArray(@response.body)
      $LOGGER.info("Listed all users in system")
      return true
    else
      return false
    end
  end

  def search
    @http.path = "/users/#{@searchId}"
    @response = @http.get
    if isResponseValid(@response, 200, "Cannot find user #{@searchId}")
      parse(@response.body)
      $LOGGER.info("User #{@searchId} found")
    end
  end

  def delete
    @http.path = "/users/#{@id}"
    @response = @http.del
    if isResponseValid(@response, 204, "Cannot delete user #{@email}")
      $LOGGER.info("User #{@email} deleted")
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







