require 'rails_helper'

RSpec.describe 'travels/edit', type: :view do
  let(:travel) do
    Travel.create!(
      title: 'MyString'
    )
  end

  before(:each) do
    assign(:travel, travel)
  end

  it 'renders the edit travel form' do
    render

    assert_select 'form[action=?][method=?]', travel_path(travel), 'post' do
      assert_select 'input[name=?]', 'travel[title]'
    end
  end
end
