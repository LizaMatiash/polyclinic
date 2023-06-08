module Admin
  class UsersController < ApplicationController
    before_action :authenticate_doctor!

    def show
      authorize! :read, :show
      @users = User.all
    end
  end
end
