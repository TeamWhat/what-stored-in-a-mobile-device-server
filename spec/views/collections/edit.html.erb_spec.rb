require 'rails_helper'

RSpec.describe 'collections/edit', type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      subject_id: 1
    ))
  end

  it 'renders the edit collection form' do
    render

    assert_select 'form[action=?][method=?]', collection_path(@collection), 'post' do

      assert_select 'input#collection_subject_id[name=?]', 'collection[subject_id]'
    end
  end
end
