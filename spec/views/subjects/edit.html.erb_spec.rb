require 'rails_helper'

RSpec.describe 'subjects/edit', type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      brand: 'MyString',
      model: 'MyString',
      device: 'MyString',
      product: 'MyString',
      serial: 'MyString',
      uid: 'MyString'
    ))
  end

  it 'renders the edit subject form' do
    render

    assert_select 'form[action=?][method=?]', subject_path(@subject), 'post' do

      assert_select 'input#subject_brand[name=?]', 'subject[brand]'

      assert_select 'input#subject_model[name=?]', 'subject[model]'

      assert_select 'input#subject_device[name=?]', 'subject[device]'

      assert_select 'input#subject_product[name=?]', 'subject[product]'

      assert_select 'input#subject_serial[name=?]', 'subject[serial]'

      assert_select 'input#subject_uid[name=?]', 'subject[uid]'
    end
  end
end
