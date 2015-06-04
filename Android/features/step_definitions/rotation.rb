When /^I rotate to portrait$/ do 
  perform_action('set_activity_orientation', 'portrait')
end

When /^I rotate to landscape$/ do 
  perform_action('set_activity_orientation', 'landscape')
end