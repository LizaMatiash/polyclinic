# frozen_string_literal: true

class DoctorAbility
  include CanCan::Ability

  def initialize(doctor)
    if doctor
      if doctor.admin?
        # admin
        can :manage, :all
      else
        # doctor
        can :read, :all
        can :search, :all
        can :update, [Appointment]
      end
    else
      # not authorized
      can :read, :all
      can :search, :all
    end
  end
end
