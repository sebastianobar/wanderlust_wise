require 'rails_helper'

RSpec.describe 'travels/new', type: :view do
  before(:each) do
    assign(:travel, Travel.new(
                      title: 'MyString'
                    ))
  end

  it 'renders new travel form' do
    render

    assert_select 'form[action=?][method=?]', travels_path, 'post' do
      assert_select 'input[name=?]', 'travel[title]'
    end
  end
end
