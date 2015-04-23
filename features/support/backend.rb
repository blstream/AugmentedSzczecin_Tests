require 'curb'
require 'json'

class Backend_connection
  def initialize(api_server)
    @api_server = api_server
    @token = nil
    @param = nil
    @path = nil
  end

  def get
    #TODO implementation should be updated
    @http = Curl::Easy.new
    @http.headers['Content-Type'] = 'application/json'
    # @http.headers = "X-Api-Auth-Token: #{@token}"
    @http.url = "#{@api_server}#{@path}?#{@param}"
    @http.perform
    return @http
  end

  def post
    #TODO implementation should be updated
    @http = Curl::Easy.new
    @http.headers['Content-Type'] = 'application/json'
    # if @token != nil
    #   @http.headers = "X-Api-Auth-Token: #{@token}"
    # end
    @http.url = "#{@api_server}#{@path}"
    @http.post JSON.generate(@param)
    return @http
  end

  def put
    #TODO implementation should be updated
    @http = Curl::Easy.new
    @http.headers['Content-Type'] = 'application/json'
    # if @token != nil
    #   @http.headers['X-Api-Auth-Token'] = @token
    # end
    @http.url = "#{@api_server}#{@path}"
    @http.put JSON.generate(@param)
    return @http
  end

  def del
    #TODO implementation should be updated
    @http = Curl::Easy.new
    # if @token != nil
    #   @http.headers = "X-Api-Auth-Token: #{@token}"
    # end
    @http.url = "#{@api_server}#{@path}"
    @http.delete = true
    @http.perform
    return @http
  end

  attr_accessor :api_server, :token, :path, :param, :http
end