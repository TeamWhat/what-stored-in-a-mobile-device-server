Given /^I am on the login page$/ do
    visit new_user_session_path
end

And /^There exists a user$/ do
  User.create(username: 'pena', password: 'penapena', password_confirmation: 'penapena')
end

And /^I fill in the correct username and password$/ do
    fill_in('user_username', with: 'pena')
    fill_in('user_password', with: 'penapena')
end

When /^I press Sign in$/ do
    click_button('Sign in')
end

Then /^I should see a success message$/ do
    expect(page).to have_content('Signed in successfully.')
end

And /^I fill in an incorrect password$/ do
    fill_in('user_username', with: 'username')
    fill_in('user_password', with: 'wrongpassword')
end

And /^I fill in an incorrect username$/ do
    fill_in('user_username', with: 'wrongusername')
    fill_in('user_password', with: 'password')
end

Then /^I should see a fail message$/ do
    expect(page).to have_content('Invalid username or password')
end




