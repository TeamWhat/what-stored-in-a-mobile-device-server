require 'rails_helper'

RSpec.describe 'texts/edit', type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      size: 1,
      mime_type: 'MyString'
    ))
  end

  it 'renders the edit text form' do
    render

    assert_select 'form[action=?][method=?]', text_path(@text), 'post' do

      assert_select 'input#text_size[name=?]', 'text[size]'

      assert_select 'input#text_mime_type[name=?]', 'text[mime_type]'
    end
  end
end
