class AppointmentsController < ApplicationController

  def show
    @appointments = DoctorsUser.where()
  end
end
