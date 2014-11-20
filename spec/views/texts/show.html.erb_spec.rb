require 'rails_helper'

RSpec.describe 'texts/show', type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      size: 1,
      mime_type: 'Mime Type'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Mime Type/)
  end
end
