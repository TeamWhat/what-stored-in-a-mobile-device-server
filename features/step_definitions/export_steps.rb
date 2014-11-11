Then /^I can export a csv file$/ do
  click_link('CSV')
  expect(page.html).to have_content('abc,def,,ghi,jkl,UID123')
end

Then /^I can export an xls file$/ do
  click_link('Excel')
  expect(page.html).to have_content('52.1')
  expect(page.html).to have_content('5026')
  expect(page.html).to have_content('Image collection ID')
end

Then /^I can not export data$/ do
  expect(page.html).not_to have_content('CSV')
end
