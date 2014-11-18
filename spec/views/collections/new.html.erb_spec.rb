require 'rails_helper'

RSpec.describe 'collections/new', type: :view do
  before(:each) do
    assign(:collection, Collection.new(
      subject_id: 1
    ))
  end

  it 'renders new collection form' do
    render

    assert_select 'form[action=?][method=?]', collections_path, 'post' do

      assert_select 'input#collection_subject_id[name=?]', 'collection[subject_id]'
    end
  end
end
