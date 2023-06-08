# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      # user
      can :read, :all
      can :search, :all
      can :create, [Appointment]
    else
      # not authorized
      can :read, :all
      can :search, :all
    end
  end
end
