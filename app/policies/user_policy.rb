class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    # true
    @current_user.admin?
    # scope.where(:id => @user.id).exists?
  end

  # def edit?
  #   binding.pry
  #   @current_user.admin?
  #   # binding.pry
  #   # scope.where(:id => @user.id).exists?
  # end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end

  # def scope
  #   Pundit.policy_scope!(@current_user, @user.class)
  # end

end
