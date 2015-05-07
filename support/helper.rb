require 'curb'
require 'json'

def isResponseValid(response, expected_response_code, error_info)
  if response.status == expected_response_code
    return true
  else
    # $LOGGER.error("Request to #{http.url} finished with code #{http.response_code}")
    $LOGGER.error(error_info)
    # $LOGGER.error(http.body_str)
    return false
  end
end


