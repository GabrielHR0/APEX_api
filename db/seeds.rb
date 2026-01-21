
puts "Limpando dados existentes..."
UserRole.delete_all
RolePermission.delete_all
Permission.delete_all
Role.delete_all
User.delete_all

puts "Iniciando Seeds..."

# =========================
# ROLES
# =========================

admin_role = Role.find_or_create_by!(name: 'admin') do |role|
  role.description = 'Administrador do sistema com acesso total'
end

editor_role = Role.find_or_create_by!(name: 'editor') do |role|
  role.description = 'Pode criar, editar e organizar conteúdos'
end

viewer_role = Role.find_or_create_by!(name: 'viewer') do |role|
  role.description = 'Pode apenas visualizar informações'
end

puts "Roles criadas."

# =========================
# RECURSOS DO SISTEMA
# =========================

resources = ['hero_card', 
  'event', 
  'user', 
  'project', 
  'extension_core', 
  'contact', 
  'company', 
  'carousel', 
  'card', 
  'address', 
  'social_media_profile'
  ] 

# =========================
# PERMISSÕES DE LEITURA
# =========================

resources.each do |resource|
  %w[read].each do |action|
    permission = Permission.find_or_create_by!(
      resource: resource,
      action: action
    ) do |p|
      p.description = "Permite visualizar #{resource}"
    end

    editor_role.permissions << permission unless editor_role.permissions.include?(permission)
    viewer_role.permissions << permission unless viewer_role.permissions.include?(permission)
  end
end

# =========================
# PERMISSÕES DE ESCRITA
# =========================

resources.each do |resource|
  %w[create update destroy].each do |action|
    permission = Permission.find_or_create_by!(
      resource: resource,
      action: action
    ) do |p|
      p.description = "Permite #{action} registros de #{resource}"
    end

    editor_role.permissions << permission unless editor_role.permissions.include?(permission)
  end
end

# =========================
# PERMISSÃO GLOBAL (ORDENAÇÃO)
# =========================

ordering_permission = Permission.find_or_create_by!(
  resource: 'ordering',
  action: 'manage'
) do |p|
  p.description = 'Permite alterar a ordem de exibição dos itens'
end

admin_role.permissions << ordering_permission unless admin_role.permissions.include?(ordering_permission)
editor_role.permissions << ordering_permission unless editor_role.permissions.include?(ordering_permission)

# =========================
# ADMIN TEM ACESSO TOTAL
# =========================
Permission.all.each do |permission|
  admin_role.permissions << permission unless admin_role.permissions.include?(permission)
end

puts "Seeds finalizados com sucesso!"
