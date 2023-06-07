module Doctors
  class AppointmentsController < ApplicationController
    before_action :authenticate_doctor!

    def index
      @appointments = Appointment.where(doctor: current_doctor)
    end

    # def create
    #   @doctor = Doctor.find(params[:doctor])
    #   @appointment = @doctor.doctors_users.new()
    #   @appointment.user = current_user
    #
    #   if @appointment.save
    #     redirect_to users_appointment_path(@appointment), notice: 'Appointment was successfully created.'
    #   else
    #     redirect_to search_doctor_path, notice: 'Troubles with appointment'
    #   end
    # end

    def update
      @appointment = Appointment.find(params[:id])
      @appointment.status = false
      if @appointment.update(appointment_params)
        redirect_to doctors_appointments_path, notice: 'Appointment was successfully closed.'
      else
        redirect_to doctors_appointments_path, notice: 'Troubles with appointment'
      end
    end


    private

    # def set_doctor
    #   @doctor = Doctor.find(params[:doctor])
    # end
    def appointment_params
      params.require(:appointment).permit(:recomendation)
    end
  end
end
