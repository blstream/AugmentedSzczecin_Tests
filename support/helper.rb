require 'curb'
require 'json'

def isResponseValid(http, expected_response_code, error_info)
  if http.response_code == expected_response_code
    return true
  else
    $LOGGER.error("Request to #{http.url} finished with code #{http.response_code}")
    $LOGGER.error(error_info)
    $LOGGER.error(http.body_str)
    return false
  end
end


