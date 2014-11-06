require 'rails_helper'

RSpec.describe 'subjects/index', type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        brand: 'Brand',
        model: 'Model',
        device: 'Device',
        product: 'Product',
        serial: 'Serial',
        uid: 'Uid1'
      ),
      Subject.create!(
        brand: 'Brand',
        model: 'Model',
        device: 'Device',
        product: 'Product',
        serial: 'Serial',
        uid: 'Uid2'
      )
    ])
  end

  it 'renders a list of subjects' do
    render
    assert_select 'tr>td', text: 'Brand'.to_s, count: 2
    assert_select 'tr>td', text: 'Model'.to_s, count: 2
    assert_select 'tr>td', text: 'Device'.to_s, count: 2
    assert_select 'tr>td', text: 'Product'.to_s, count: 2
    assert_select 'tr>td', text: 'Serial'.to_s, count: 2
    expect(rendered).to match(/Uid1/)
    expect(rendered).to match(/Uid2/)
  end
end
