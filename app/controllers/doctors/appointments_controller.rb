module Doctors
  class AppointmentsController < ApplicationController
    before_action :authenticate_doctor!

    authorize_resource

    def index
      @appointments = Appointment.where(doctor: current_doctor)
    end

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

    def appointment_params
      params.require(:appointment).permit(:recomendation)
    end
  end
end
