$LOGGER = Logger.new(STDOUT)
$LOGGER.formatter = proc do |severity, datetime, progname, msg|
  if severity == "INFO"
    "\e[1;32m #{severity}: #{msg}\n"
  elsif severity == "WARN"
    "\e[1;33m #{severity}: #{msg}\n"
  elsif severity == "ERROR"
    "\e[1;31m #{severity}: #{msg}\n"
  end
end

$API_SERVER = 'http://78.133.154.62:1080'