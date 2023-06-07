module Users
  class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
    end
  end
end
