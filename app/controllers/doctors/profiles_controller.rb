module Doctors
  class ProfilesController < ApplicationController
    before_action :authenticate_doctor!

    def show
    end
  end
end
