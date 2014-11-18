require 'rails_helper'

RSpec.describe 'applications/show', type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      label: 'Label',
      package_name: 'Package Name',
      version_name: 'Version Name',
      target_sdk_version: 'Target Sdk Version'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Package Name/)
    expect(rendered).to match(/Version Name/)
    expect(rendered).to match(/Target Sdk Version/)
  end
end
