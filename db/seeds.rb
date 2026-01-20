# db/seeds.rb
puts "🔄 Iniciando seed do sistema RBAC..."

# Limpar dados existentes
puts "🧹 Limpando dados existentes..."
UserRole.delete_all
RolePermission.delete_all
Permission.delete_all
Role.delete_all
User.delete_all

puts "📝 Criando permissões do sistema..."

# Lista de permissões COM AÇÕES VÁLIDAS
# Verifique quais ações seu modelo Permission aceita
permissions_data = [
  # Administração do sistema - use 'manage' se for aceito, senão use outra
  { resource: 'system', action: 'manage', description: 'Gerenciar todo o sistema' },
  
  # Gerenciamento de usuários - use ações básicas CRUD
  { resource: 'user', action: 'read', description: 'Visualizar usuários' },
  { resource: 'user', action: 'create', description: 'Criar usuários' },
  { resource: 'user', action: 'update', description: 'Editar usuários' },
  { resource: 'user', action: 'destroy', description: 'Excluir usuários' },
  
  { resource: 'role', action: 'read', description: 'Visualizar funções' },
  { resource: 'role', action: 'create', description: 'Criar funções' },
  { resource: 'role', action: 'update', description: 'Editar funções' },
  { resource: 'role', action: 'destroy', description: 'Excluir funções' },
  
  { resource: 'permission', action: 'read', description: 'Visualizar permissões' },
  { resource: 'permission', action: 'create', description: 'Criar permissões' },
  { resource: 'permission', action: 'update', description: 'Editar permissões' },
  { resource: 'permission', action: 'destroy', description: 'Excluir permissões' },
  
  # Dashboard - ações simples
  { resource: 'dashboard', action: 'read', description: 'Acessar dashboard' },
  
  # Landing Page - Conteúdo (use 'destroy' em vez de 'delete' se necessário)
  { resource: 'hero_card', action: 'read', description: 'Visualizar hero cards' },
  { resource: 'hero_card', action: 'create', description: 'Criar hero cards' },
  { resource: 'hero_card', action: 'update', description: 'Editar hero cards' },
  { resource: 'hero_card', action: 'destroy', description: 'Excluir hero cards' },
  
  { resource: 'event', action: 'read', description: 'Visualizar eventos' },
  { resource: 'event', action: 'create', description: 'Criar eventos' },
  { resource: 'event', action: 'update', description: 'Editar eventos' },
  { resource: 'event', action: 'destroy', description: 'Excluir eventos' },
  
  { resource: 'card', action: 'read', description: 'Visualizar cards' },
  { resource: 'card', action: 'create', description: 'Criar cards' },
  { resource: 'card', action: 'update', description: 'Editar cards' },
  { resource: 'card', action: 'destroy', description: 'Excluir cards' },
  
  { resource: 'carousel_frame', action: 'read', description: 'Visualizar carrosséis' },
  { resource: 'carousel_frame', action: 'create', description: 'Criar carrosséis' },
  { resource: 'carousel_frame', action: 'update', description: 'Editar carrosséis' },
  { resource: 'carousel_frame', action: 'destroy', description: 'Excluir carrosséis' },
  
  # Contatos e comunicação
  { resource: 'contact', action: 'read', description: 'Visualizar contatos' },
  { resource: 'contact', action: 'create', description: 'Criar contatos' },
  { resource: 'contact', action: 'update', description: 'Editar contatos' },
  { resource: 'contact', action: 'destroy', description: 'Excluir contatos' },
  
  { resource: 'email_log', action: 'read', description: 'Visualizar logs de email' },
  { resource: 'email_log', action: 'create', description: 'Criar logs de email' },
  
  # Social Media
  { resource: 'social_media_profile', action: 'read', description: 'Visualizar redes sociais' },
  { resource: 'social_media_profile', action: 'create', description: 'Criar perfis sociais' },
  { resource: 'social_media_profile', action: 'update', description: 'Editar perfis sociais' },
  { resource: 'social_media_profile', action: 'destroy', description: 'Excluir perfis sociais' },
  
  # Empresa
  { resource: 'company', action: 'read', description: 'Visualizar dados da empresa' },
  { resource: 'company', action: 'update', description: 'Editar dados da empresa' },
  
  { resource: 'company_address', action: 'read', description: 'Visualizar endereço' },
  { resource: 'company_address', action: 'create', description: 'Criar endereço' },
  { resource: 'company_address', action: 'update', description: 'Editar endereço' },
  
  # Projetos e extensões
  { resource: 'project', action: 'read', description: 'Visualizar projetos' },
  { resource: 'project', action: 'create', description: 'Criar projetos' },
  { resource: 'project', action: 'update', description: 'Editar projetos' },
  { resource: 'project', action: 'destroy', description: 'Excluir projetos' },
  
  { resource: 'extension_core', action: 'read', description: 'Visualizar extensões' },
  { resource: 'extension_core', action: 'create', description: 'Criar extensões' },
  { resource: 'extension_core', action: 'update', description: 'Editar extensões' },
  { resource: 'extension_core', action: 'destroy', description: 'Excluir extensões' },
  
  # Configurações
  { resource: 'settings', action: 'read', description: 'Visualizar configurações' },
  { resource: 'settings', action: 'update', description: 'Editar configurações' }
]

# Criar permissões com tratamento de erro
permissions_data.each do |perm_data|
  begin
    Permission.create!(perm_data)
    puts "  ✅ #{perm_data[:resource]}.#{perm_data[:action]}"
  rescue ActiveRecord::RecordInvalid => e
    puts "  ⚠️  ERRO em #{perm_data[:resource]}.#{perm_data[:action]}: #{e.message}"
    
    # Tenta criar com ação alternativa
    if perm_data[:action] == 'delete' || perm_data[:action] == 'destroy'
      alt_action = perm_data[:action] == 'delete' ? 'destroy' : 'delete'
      begin
        Permission.create!(perm_data.merge(action: alt_action))
        puts "  ✅ #{perm_data[:resource]}.#{alt_action} (alternativa)"
      rescue => e2
        puts "  ❌ Falha alternativa também: #{e2.message}"
      end
    end
  end
end

total_permissions = Permission.count
puts "📊 Total de permissões criadas: #{total_permissions}"

# SE NENHUMA PERMISSÃO FOI CRIADA, CRIE ALGUMAS BÁSICAS
if Permission.count == 0
  puts "⚠️  Nenhuma permissão criada. Criando permissões básicas..."
  
  # Permissões mínimas
  basic_permissions = [
    { resource: 'user', action: 'read', description: 'Ver usuários' },
    { resource: 'user', action: 'create', description: 'Criar usuários' },
    { resource: 'user', action: 'update', description: 'Editar usuários' },
    { resource: 'user', action: 'destroy', description: 'Excluir usuários' },
    
    { resource: 'hero_card', action: 'read', description: 'Ver hero cards' },
    { resource: 'hero_card', action: 'create', description: 'Criar hero cards' },
    { resource: 'hero_card', action: 'update', description: 'Editar hero cards' },
    { resource: 'hero_card', action: 'destroy', description: 'Excluir hero cards' },
  ]
  
  basic_permissions.each do |perm|
    Permission.create!(perm)
    puts "  ✅ #{perm[:resource]}.#{perm[:action]} (básica)"
  end
end

puts "👑 Criando funções (roles)..."

# 1. ADMIN - Acesso total
admin_role = Role.create!(
  name: 'admin',
  description: 'Administrador com acesso total a todos os recursos do sistema'
)
admin_role.permissions = Permission.all
puts "  👑 Admin criado com #{admin_role.permissions.count} permissões"

# 2. EDITOR - Gerencia conteúdo
editor_permissions = Permission.where(resource: [
  'hero_card', 'event', 'card', 'carousel_frame', 'social_media_profile',
  'contact', 'dashboard'
]).where(action: ['read', 'create', 'update'])

editor_role = Role.create!(
  name: 'editor',
  description: 'Editor de conteúdo - pode gerenciar toda a landing page'
)
editor_role.permissions = editor_permissions
puts "  ✏️ Editor criado com #{editor_role.permissions.count} permissões"

# 3. VIEWER - Apenas visualização
viewer_permissions = Permission.where(action: 'read')

viewer_role = Role.create!(
  name: 'viewer',
  description: 'Visualizador - pode apenas visualizar conteúdo'
)
viewer_role.permissions = viewer_permissions
puts "  👁️ Viewer criado com #{viewer_role.permissions.count} permissões"

puts "👤 Criando usuários..."

# 1. Usuário Admin
admin_user = User.create!(
  email: 'admin@apex.com',
  password: 'Admin@123',
  password_confirmation: 'Admin@123'
)
admin_user.add_role('admin')
puts "  👑 Admin: admin@apex.com / Admin@123"

# 2. Usuário Editor
editor_user = User.create!(
  email: 'editor@apex.com',
  password: 'Editor@123',
  password_confirmation: 'Editor@123'
)
editor_user.add_role('editor')
puts "  ✏️ Editor: editor@apex.com / Editor@123"

# 3. Usuário Viewer
viewer_user = User.create!(
  email: 'viewer@apex.com',
  password: 'Viewer@123',
  password_confirmation: 'Viewer@123'
)
viewer_user.add_role('viewer')
puts "  👁️ Viewer: viewer@apex.com / Viewer@123"

# 4. Usuário sem role (para teste)
regular_user = User.create!(
  email: 'user@apex.com',
  password: 'User@123',
  password_confirmation: 'User@123'
)
puts "  👤 Regular User: user@apex.com / User@123 (sem role)"

puts "📊 Resumo do seed:"
puts "  • #{Permission.count} permissões criadas"
puts "  • #{Role.count} funções criadas"
puts "  • #{User.count} usuários criados"

puts "🧪 Testando permissões..."

# Teste básico
admin_test = User.find_by(email: 'admin@apex.com')
editor_test = User.find_by(email: 'editor@apex.com')
viewer_test = User.find_by(email: 'viewer@apex.com')

puts "  ✅ Admin pode criar hero cards: #{admin_test.can?('hero_card', 'create')}" if admin_test
puts "  ✅ Editor pode criar hero cards: #{editor_test.can?('hero_card', 'create')}" if editor_test
puts "  ✅ Viewer pode ler hero cards: #{viewer_test.can?('hero_card', 'read')}" if viewer_test

puts "\n🎉 Seed do RBAC concluído!"
puts "\n📋 Credenciais:"
puts "   Admin: admin@apex.com / Admin@123"
puts "   Editor: editor@apex.com / Editor@123"
puts "   Viewer: viewer@apex.com / Viewer@123"