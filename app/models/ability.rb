# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.instance_of?(::Doctor)
        if user.admin?
          # admin
          can :manage, :all
        else
          # doctor
          can :read, :all
          can :search, :all
          can :update, [Appointment], doctor: user
        end
      else
        # user
        can :read, :all
        can :search, :all
        can :create, [Appointment]
        # can :read, :find
      end
    else
      # not authorized
      can :read, :all
      can :search, :all
    end
  end
end
