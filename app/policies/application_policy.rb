class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    check_permission(:read)
  end

  def show?
    check_permission(:read)
  end

  def create?
    check_permission(:create)
  end

  def new?
    create?
  end

  def update?
    check_permission(:update)
  end

  def edit?
    update?
  end

  def destroy?
    check_permission(:destroy)
  end

  # AÇÕES ESPECIAIS

  def manage?
    check_permission(:manage, resource: 'ordering')
  end

  # FALLBACK 

  def method_missing(method_name, *args, &block)
    if method_name.to_s.end_with?('?')
      manage?
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.end_with?('?') || super
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  private

  def check_permission(action, resource: nil)
    return false unless user
    resource ||= record.class.name.underscore

    user.can?(resource, action)
  end
end
