class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user && user.admin?
        can :access, :rails_admin
        can :dashboard
        if user.super_admin?
            can :manage, :all
        else
            can :manage, :all
            #cannot [:edit], User, :is_admin
            #cannot :edit, User, :is_super_admin
            cannot [:destroy, :edit], User, :is_admin => true
            can [:edit], User, :id => user.id
            cannot [:destroy, :edit], User, :is_super_admin => true
        end
    end
  end
end
