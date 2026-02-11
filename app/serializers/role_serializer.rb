class RoleSerializer
  def self.render(role)
    {
      id: role.id,
      name: role.name,
      permissions: role.permissions.map do |p|
        {
          id: p.id,
          resource: p.resource,
          action: p.action,
          description: p.description
        }
      end
    }
  end

  def self.render_collection(roles)
    roles.map { |role| render(role) }
  end
end
