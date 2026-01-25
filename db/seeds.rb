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

resources = [
  'dashboard',
  'hero_card', 
  'event', 
  'user', 
  'project', 
  'extension_core', 
  'contact', 
  'company', 
  'carousel_frame', 
  'card',
  'address', 
  'social_media_profile',
  'page_view'
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

# =========================
# USUÁRIOS DE EXEMPLO
# =========================

puts "Criando usuários..."

# Administrador
admin_user = User.create!(
  email: 'apex@example.com',
  password: '9qacht',
  password_confirmation: '9qacht',
  created_at: Time.current,
  updated_at: Time.current
)
UserRole.create!(user: admin_user, role: admin_role)
puts "✓ Admin: apex@example.com / 9qacht"

# Editor
editor_user = User.create!(
  email: 'editor@example.com',
  password: 'editor123',
  password_confirmation: 'editor123',
  created_at: Time.current,
  updated_at: Time.current
)
UserRole.create!(user: editor_user, role: editor_role)
puts "✓ Editor: editor@example.com / ueh43"

# Viewer
viewer_user = User.create!(
  email: 'viewer@example.com',
  password: 'viewer123',
  password_confirmation: 'viewer123',
  created_at: Time.current,
  updated_at: Time.current
)
UserRole.create!(user: viewer_user, role: viewer_role)
puts "✓ Viewer: viewer@example.com / viewer123"

puts "\nSeeds finalizados com sucesso!"
puts "Usuários criados:"
puts "1. apex@example.com (senha: 9qach)"
puts "2. editor@example.com (senha: ueh43)"
puts "3. viewer@example.com (senha: viewer123)"