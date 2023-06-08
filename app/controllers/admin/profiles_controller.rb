module Admin
  class ProfilesController < ApplicationController
    before_action :authenticate_doctor!

    def show
      authorize! :read, :show
    end
  end
end
