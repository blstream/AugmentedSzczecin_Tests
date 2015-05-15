require 'curb'
require 'excon'
require 'json'

class People

  def initialize(resources = nil, api_server = $API_SERVER)
    @id = nil
    if resources != nil
      @name = resources['name']
      @surname = resources['surname']
      @latitude = resources['latitude']
      @longitude = resources['longitude']
    end
    @http = Backend_connection.new(api_server)
  end

  def list
    @http.path = "/people"
    @response = @http.get
    #puts(@response.body)
    if isResponseValid(@response, 200, "Cannot list people")
      parseArray(@response.body)
      $LOGGER.info("Listed all people in system")
      return true
    else
      return false
    end
  end

    def create
    @http.path = "/people"
    #@http.param = {"name" => @name, "surname" => @surname, "location"=>{"latitude" => @latitude, "longitude" => @longitude}}
    @http.param = {"name" => @name, "location"=>{"latitude" => @latitude, "longitude" => @longitude}}
    @response = @http.post
    #puts(@response.body)
    if isResponseValid(@response, 200, "Cannot create person #{@name} #{@surname}")
      parse(@response.body)
      #$LOGGER.info("Person #{@name} #{@surname} created.")
      $LOGGER.info("Person #{@name} created.")
      return true   
    else
      return false
    end
  end

  def search
  @http.path = "/people/#{@id}"
  @response = @http.get
  puts(@response.body)
  if isResponseValid(@response, 200, "Cannot find person #{@id}")
    parse(@response.body)
    $LOGGER.info("Person #{@id} found")
  return true
  else
    return false
  end
end

  def update
  @http.path = "/people/#{@id}"
  @http.param = {"name" => @name, "location"=>{"latitude" => @latitude, "longitude" => @longitude}}
  @response = @http.put
  puts(@response.body)
  if isResponseValid(@response, 200, "Cannot update place #{@id} #{@name}")
    parse(@response.body)
    $LOGGER.info("Place #{id} #{@name} updated.")
    return true   
  else
    return false
  end
end

  def delete
  @http.path = "/people/#{@id}"
  @response = @http.del
  if isResponseValid(@response, 204, "Cannot delete person #{@name}")
    $LOGGER.info("Person #{@name} deleted")
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