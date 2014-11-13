require 'rails_helper'

RSpec.describe "applications/new", :type => :view do
  before(:each) do
    assign(:application, Application.new(
      :label => "MyString",
      :package_name => "MyString",
      :version_name => "MyString",
      :target_sdk_version => "MyString"
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do

      assert_select "input#application_label[name=?]", "application[label]"

      assert_select "input#application_package_name[name=?]", "application[package_name]"

      assert_select "input#application_version_name[name=?]", "application[version_name]"

      assert_select "input#application_target_sdk_version[name=?]", "application[target_sdk_version]"
    end
  end
end
