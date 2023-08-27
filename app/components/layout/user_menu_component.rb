# frozen_string_literal: true

module Layout
  class UserMenuComponent < ViewComponent::Base


    def initialize(user:, links: [])
      @user = user
      @links = links
    end

    def render?
      user.present?
    end

    private

    attr_reader :user, :links
  end
end
