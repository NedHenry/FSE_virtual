# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.present?
      can :read, Page
      can :read, Endorsement
      can :read, Link

      can :read, Event

      if user.moderator?
        can :manage, Room do |room|
          room.moderator_ids.include? user.id
        end
      end

      if user.affiliate?
        can :manage, Affiliate, {user_id: user.id}
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
	can :manage, Page
	can :manage, Affiliate
        can :manage, Endorsement

	can :manage, Room
	can :manage, Link
	can :manage, Event
      end
    end
  end
end
