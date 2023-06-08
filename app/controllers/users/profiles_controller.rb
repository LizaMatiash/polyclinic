module Users
  class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
      authorize! :read, :show
    end
  end
end
