class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Room
    can :manage, Reservation, user: user
  end
end
