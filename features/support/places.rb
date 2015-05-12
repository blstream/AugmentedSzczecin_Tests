require 'curb'
require 'excon'
require 'json'

class Places
  def initialize(searchId = nil, name = nil, location = nil, latitude = nil, longitude = nil, category = nil , api_server = $API_SERVER)
    @id = nil
    @searchId = searchId
    @name = name
    @location = location
    @latitude = latitude
    @longitude = longitude
    @category = category
    @http = Backend_connection.new(api_server)
  end

  def list
    @http.path = "/places"
    @response = @http.get
    if isResponseValid(@response, 200, "Cannot list places")
      parseArray(@response.body)
      $LOGGER.info("Listed all places in system")
      return true
    else
      return false
    end
  end

  def search
  @http.path = "/places/#{@searchId}"
  @response = @http.get
  if isResponseValid(@response, 200, "Cannot find place #{@searchId}")
    parse(@response.body)
    $LOGGER.info("Place #{@searchId} found")
  return true
  else
    return false
  end
end

  def update
   @http.path = "/places/#{@searchId}"
   @http.param = {"name" => @name, "location"=>{"latitude" => @latitude, "longitude" => @longitude}}
   @response = @http.put
   if isResponseValid(@response, 200, "Cannot update place #{@searchId} #{@name}")
    puts(@response.body)
    parse(@response.body)
    $LOGGER.info("Place #{@name} updated.")
    return true   
    else
      return false
    end
  end

  def create
    @http.path = "/places"
    @http.param = {"name" => @name, "location"=>{"latitude" => @latitude, "longitude" => @longitude}}
    @response = @http.post
    if isResponseValid(@response, 200, "Cannot create place #{@name}")
      puts(@response.body)
      parse(@response.body)
      $LOGGER.info("Place #{@name} created.")
      return true   
    else
      return false
    end
  end



=begin






  def delete
    @http.path = "/users/#{@id}"
    @response = @http.del
    if isResponseValid(@response, 204, "Cannot delete user #{@email}")
      $LOGGER.info("User #{@email} deleted")
    end
  end
=end
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