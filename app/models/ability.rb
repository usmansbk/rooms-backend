class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Room

    return unless user.present?

    can :manage, Room, user: user
    can :manage, Reservation, user: user
  end
end
