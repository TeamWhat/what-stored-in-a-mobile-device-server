require 'rails_helper'

RSpec.describe 'texts/index', type: :view do
  before(:each) do
    assign(:texts, [
      Text.create!(
        size: 1,
        mime_type: 'Mime Type'
      ),
      Text.create!(
        size: 1,
        mime_type: 'Mime Type'
      )
    ])
  end

  it 'renders a list of texts' do
    render
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 'Mime Type'.to_s, count: 2
  end
end
