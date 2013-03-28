Given /^I follow an old format link to accept the thing$/ do
end

Then /^I should be asked to create an account$/ do
  page.should have_content("Your request to a start a new group on Loomio has been approved!")
end

When /^I click the old format invitation link to start a new group$/ do
  visit("/groups/#{@group_request.group_id}/invitations/#{@group_request.token}")
end