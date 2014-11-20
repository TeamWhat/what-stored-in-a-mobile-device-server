require 'rails_helper'

RSpec.describe 'texts/new', type: :view do
  before(:each) do
    assign(:text, Text.new(
      size: 1,
      mime_type: 'MyString'
    ))
  end

  it 'renders new text form' do
    render

    assert_select 'form[action=?][method=?]', texts_path, 'post' do

      assert_select 'input#text_size[name=?]', 'text[size]'

      assert_select 'input#text_mime_type[name=?]', 'text[mime_type]'
    end
  end
end
