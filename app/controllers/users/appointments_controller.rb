module Users
  class AppointmentsController < ApplicationController
    before_action :authenticate_user!

    def show
      @appointments = Appointment.where(user: current_user)
    end

    def create
      @doctor = Doctor.find(params[:doctor])
      @appointment = @doctor.appointments.new()
      @appointment.user = current_user

      if @appointment.save
        redirect_to users_appointment_path(@appointment), notice: 'Appointment was successfully created.'
      else
        redirect_to search_doctor_path, notice: 'Troubles with appointment'
      end
    end

    private

    def set_doctor
      @doctor = Doctor.find(params[:doctor])
    end
  end
end
