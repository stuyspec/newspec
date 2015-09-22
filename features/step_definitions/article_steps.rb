Given(/^the following articles/) do |table|
  #tables.hashes.each do |h|
end

### MOVE SOMWHERE
When(/^I go to the home page$/) do
  get '/'
  expect(response.body).to be_eql 'foo'
end

Then(/^I get that article$/) do
  json = {}.to_json
  puts page
  expect(pages.status).to be_eql json
end
