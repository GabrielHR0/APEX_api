class ExtensionCorePolicy < ApplicationPolicy
  def remove_image?
      check_permission(:update)
  end

  def add_images?
      check_permission(:update)
  end

  def remove_icon?
      check_permission(:update)
  end
end