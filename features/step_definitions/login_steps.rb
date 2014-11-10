Given /^I am on the login page$/ do
  visit new_user_session_path
end

And /^There exists a user$/ do
  FactoryGirl.create(:user)
end

And /^I fill in the correct username and password$/ do
  fill_in('user_username', with: 'admin')
  fill_in('user_password', with: 'password')
end

When /^I press Sign in$/ do
  click_button('Sign in')
end

Then /^I should see a success message$/ do
  expect(page).to have_content('Signed in successfully.')
end

And /^I fill in an incorrect password$/ do
  fill_in('user_username', with: 'admin')
  fill_in('user_password', with: 'wrongpassword')
end

And /^I fill in an incorrect username$/ do
  fill_in('user_username', with: 'wrongusername')
  fill_in('user_password', with: 'password')
end

Then /^I should see a fail message$/ do
  expect(page).to have_content('Invalid username or password')
end

Given /^I have logged in$/ do
  FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in('user_username', with: 'admin')
  fill_in('user_password', with: 'password')
  click_button('Sign in')
end

And /^I have not logged in$/ do
  click_on('Sign out') if page.has_content? 'Sign out'
end
