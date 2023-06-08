module Admin
  class DoctorsController < ApplicationController
    before_action :authenticate_doctor!

    def index
      authorize! :read, :index
      @doctors = Doctor.all
      @categories = Category.all
    end

    def new
    end

    def create
      @doctor = Doctor.new(doctor_params)

      if @doctor.save
        redirect_to admin_profile_path, notice: 'Doctor was successfully created.'
      else
        redirect_to admin_doctors_path, notice: 'Troubles with doctor creation'
      end
    end

    def update
      @doctor = Doctor.find(params[:id])

      if @doctor.update(doctor_params)
        redirect_to admin_profile_path, notice: 'Doctor was successfully updated.'
      else
        redirect_to admin_doctors_path, notice: 'Troubles with updating doctor'
      end
    end

    private

    def doctor_params
      params.permit(:phone, :password, :category, :category_id, :admin)
    end
  end
end
