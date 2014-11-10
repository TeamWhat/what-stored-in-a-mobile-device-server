When /^I go to the subjects page$/ do
  visit subjects_path
end

Then /^I should see the device info$/ do
  expect(page).to have_content('abc')
  expect(page).not_to have_content('nil')
  expect(page).not_to have_content('false')
  expect(page).not_to have_content('true')
  expect(page).to have_content(Date.current.to_s)
  expect(page).to have_content('def')
  expect(page).to have_content('ghi')
  expect(page).to have_content('jkl')
end

Then /^I should not see the device info$/ do
  expect(page).not_to have_content('jkl')
  expect(page).not_to have_content(Date.current.to_s)
  expect(page).not_to have_content('ghi')
  expect(page).not_to have_content('def')
  expect(page).not_to have_content('abc')
end

And /^There exists device info$/ do
  FactoryGirl.create(:subject, uid: 'UID123', date: Date.current, brand:'abc', model:'def', product:'ghi', serial:'jkl', device:nil)
end
