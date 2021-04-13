class UserPolicy < ApplicationPolicy
attr_reader :current_user, :model
def initialize(current_user, model)
  @current_user = current_user
  @user = model

end
  def new?
    @current_user.role == 'admin'
  end

  def index?
    @current_user.role == 'admin'
  end

  def create?
    @current_user.role == 'admin'
  end

  def update?
    @current_user.role == 'admin'
  end

  def edit?
    @current_user.role == 'admin'
  end

  def destroy?
    @current_user.role == 'admin'
  end
# class Scope
#   attr_reader :user, :model

# def initialize user, model
#   @current_user = user
#   @user = model
# end

# def index?
#   @current_user.user?
# end

# def show?
#   @user.present?
# end
# end
end
