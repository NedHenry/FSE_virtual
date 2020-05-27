# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.present?
      can :read, AlleyPage
      can :read, Link
      can :read, Promo
      can :read, Event

      if user.moderator?
        can :manage, Room do |room|
          room.moderator_ids.include? user.id
        end
      end

      if user.vendor?
        can :manage, Vendor, {user_id: user.id}
	can :manage, Event, {user_id: user.id}
	can :manage, Room, {owner_id: user.id}
	can :create, Event
      end

      if user.performer?
        can :manage, Event, {user_id: user.id}
        can :manage, Room, {owner_id:  user.id}
        can :create, Event
      end

      if user.admin?
	can :manage, Vendor
	can :manage, Room
	can :manage, AlleyPage
	can :read, Link
	can :manage, Promo
	can :manage, Event
      end
    end
  end
end
