# frozen_string_literal: true

class Ui::PrincipalButtonComponentPreview < ViewComponent::Preview
  # @param text text
  def default(text: 'Button')
    render(Ui::PrincipalButtonComponent.new) do
      text
    end
  end
end
