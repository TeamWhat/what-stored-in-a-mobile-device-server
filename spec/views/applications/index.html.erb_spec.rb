require 'rails_helper'

RSpec.describe "applications/index", :type => :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :label => "Label",
        :package_name => "Package Name",
        :version_name => "Version Name",
        :target_sdk_version => "Target Sdk Version"
      ),
      Application.create!(
        :label => "Label",
        :package_name => "Package Name",
        :version_name => "Version Name",
        :target_sdk_version => "Target Sdk Version"
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Package Name".to_s, :count => 2
    assert_select "tr>td", :text => "Version Name".to_s, :count => 2
    assert_select "tr>td", :text => "Target Sdk Version".to_s, :count => 2
  end
end
