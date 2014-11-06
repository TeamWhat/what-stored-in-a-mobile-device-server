Given /^I am on the login page$/ do
    visit new_user_session_path
end

And /^I fill in the correct username and password$/ do
    fill_in('user_username', with: 'username')
    fill_in('user_password', with: 'password')
end

When /^I press Sign in$/
    click_on('Sign in')
end

Then /^I should see a success message$/
    expect(page).to have_content('')
end

And /^I fill in an incorrect password$/ do
    fill_in('user_username', with: 'username')
    fill_in('user_password', with: 'wrongpassword')
end

And /^I fill in an incorrect username$/ do
    fill_in('user_username', with: 'wrongusername')
    fill_in('user_password', with: 'password')
end

Then /^I should see a fail message$/
    expect(page).to have_content('Invalid username or password')
end




