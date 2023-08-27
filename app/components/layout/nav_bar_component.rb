# frozen_string_literal: true
module Layout
  class NavBarComponent < ViewComponent::Base

    def initialize(links: [],  user_signed_in:, user:)
      @user_signed_in = user_signed_in
      @user = user
      @links = links
    end



    private
    attr_reader :user, :links, :user_signed_in
    alias user_signed_in? user_signed_in



  end
end
