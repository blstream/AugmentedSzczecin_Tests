
require 'curb'
require 'json'

class User
  def initialize(email = nil, password = nil, name = "Some User", api_server = $API_SERVER)
    @id = nil
    @name = name
    @email = email
    @password = password
    @http = Backend_connection.new(api_server)
  end

  def create
    @http.path = "/users"
    @http.param = {"email" => @email, "password"=> @password}
    @response = @http.post
    if isResponseValid(@response, 200, "Cannot create user #{@email}")
      parse(@response.body_str)
      $LOGGER.info("User #{@email} created.")
      return true   
    else
      return false
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
    # @token = @hash['token'] if @hash['token'] != nil
  end

  attr_accessor :email, :password
end







