module Users
  class AppointmentsController < ApplicationController
    before_action :authenticate_user!

    authorize_resource

    def index
      @appointments = Appointment.where(user: current_user)
    end

    def create
      if params[:doctor].present?
        @doctor = Doctor.find(params[:doctor])
        @appointment = @doctor.appointments.new
        @appointment.user = current_user

        redirect_to users_appointments_path, notice: 'Appointment was successfully created.' if @appointment.save
      end

      redirect_to search_doctor_path, notice: 'Troubles with appointment' if @appointment.nil?
    end

    private

    def set_doctor
      @doctor = Doctor.find(params[:doctor])
    end
  end
end
