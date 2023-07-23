require 'rails_helper'

RSpec.describe 'travels/show', type: :view do
  before(:each) do
    assign(:travel, Travel.create!(
                      title: 'Title'
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
  end
end
