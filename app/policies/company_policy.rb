class CompanyPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.vip?
  end

  def edit?
    @user.vip? or @record.user_id == @user.id
  end

  def destroy?
    @user.vip? or @record.user_id == @user.id
  end

end
