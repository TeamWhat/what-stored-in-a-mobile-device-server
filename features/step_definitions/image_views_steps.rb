When /^I go to the images page$/ do
  visit images_path
end

When /^I go to the page of a collection$/ do
  ic = Collection.first
  visit collection_path(ic)
end

Then /^I should see the image data$/ do
  expect(page).to have_content('5026')
  expect(page).to have_content('52.1')
  expect(page).not_to have_content('nil')
  expect(page).not_to have_content('false')
  expect(page).not_to have_content('true')
  expect(page).to have_content(Date.current.to_s)
  expect(page).to have_content(Date.yesterday.to_s)
end

Then /^I should not see the image data$/ do
  expect(page).not_to have_content('5026')
  expect(page).not_to have_content('52.1')
  expect(page).not_to have_content(Date.current.to_s)
  expect(page).not_to have_content(Date.yesterday.to_s)
end

And /^There exists image data$/ do
  ic = FactoryGirl.create(:collection)
  FactoryGirl.create(:image, size: '5026', date: Date.current, date_modified: Date.yesterday, is_private: nil, latitude: 52.1, collection_id: ic.id)
end
