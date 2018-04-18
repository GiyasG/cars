class CompanyPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.admin? or @user.vip?
  end

  def edit?
    (@user.vip? and @record.user_id == @user.id) or @user.admin?
  end

  def destroy?
    (@user.vip? and @record.user_id == @user.id) or @user.admin?
  end

end
