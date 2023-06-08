class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= current_doctor ? DoctorAbility.new(current_doctor) : Ability.new(current_user)
  end
end
