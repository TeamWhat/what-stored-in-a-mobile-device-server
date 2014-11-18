require 'rails_helper'

RSpec.describe 'applications/edit', type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      label: 'MyString',
      package_name: 'MyString',
      version_name: 'MyString',
      target_sdk_version: 'MyString'
    ))
  end

  it 'renders the edit application form' do
    render

    assert_select 'form[action=?][method=?]', application_path(@application), 'post' do

      assert_select 'input#application_label[name=?]', 'application[label]'

      assert_select 'input#application_package_name[name=?]', 'application[package_name]'

      assert_select 'input#application_version_name[name=?]', 'application[version_name]'

      assert_select 'input#application_target_sdk_version[name=?]', 'application[target_sdk_version]'
    end
  end
end
