# frozen_string_literal: true

class Layout::NavBarComponentPreview < ViewComponent::Preview
  def default
    render(Layout::NavBarComponent.new(links: [{href: '#', text: 'Home'}], user_signed_in: false, user: nil))
  end
end
