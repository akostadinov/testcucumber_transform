When(/^I try to update my profile info with:$/) do |table|
  # obviously this is only to serve our example scenario
  @result = {
    success: false,
    error: "you dummy: address #{user(1).email} already in use"
  }

  puts table.rows_hash.to_yaml
end

Then(/^the operation should fail$/) do
  raise if @result[:success]
end

Then(/^the error message should contain "([^"]*)"$/) do |arg1|
  puts arg1
  raise unless @result[:error].include? arg1
end

