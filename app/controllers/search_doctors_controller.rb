class SearchDoctorsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize! :read, :show
    @categories = Category.all
  end

  def find
    authorize! :read, :find
    @category = Category.find(params[:category])
    @doctors = Doctor.where(category: @category)
  end
end
