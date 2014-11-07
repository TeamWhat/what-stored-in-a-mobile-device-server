require 'rails_helper'

RSpec.describe 'subjects/show', type: :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      brand: 'Brand',
      model: 'Model',
      device: 'Device',
      product: 'Product',
      serial: 'Serial',
      uid: 'Uid'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Device/)
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/Serial/)
    expect(rendered).to match(/Uid/)
  end
end
