puts "\n🌱 Limpando e populando banco...\n"

ActiveRecord::Base.transaction do
  puts "👤 Criando roles..."

  admin_role = Role.find_or_create_by!(name: 'admin') do |role|
    role.description = 'Administrador do sistema com acesso total'
  end

  editor_role = Role.find_or_create_by!(name: 'editor') do |role|
    role.description = 'Pode criar e editar conteúdos'
  end

  viewer_role = Role.find_or_create_by!(name: 'viewer') do |role|
    role.description = 'Pode apenas visualizar'
  end

  puts "🔐 Criando permissões..."

  resources = %w[
    user role permission
    member dashboard hero_banner hero_card event project
    extension_core contact company carousel_frame card address
    social_media_profile page_view
  ]

  actions = %w[read create update destroy]

  resources.each do |resource|
    actions.each do |action|
      Permission.find_or_create_by!(
        resource: resource,
        action: action
      ) do |p|
        p.description = case action
                        when 'read'
                          "Permite visualizar #{resource.pluralize}"
                        when 'create'
                          "Permite criar #{resource.pluralize}"
                        when 'update'
                          "Permite editar #{resource.pluralize}"
                        when 'destroy'
                          "Permite remover #{resource.pluralize}"
                        end
      end
    end
  end

  Permission.find_or_create_by!(
    resource: 'ordering',
    action: 'manage'
  ) do |p|
    p.description = 'Permite alterar a ordem dos registros'
  end

  Permission.find_or_create_by!(
    resource: 'cache',
    action: 'manage'
  ) do |p|
    p.description = 'Permite limpar o cache do sistema'
  end

  puts "🔗 Associando permissões às roles..."

  viewer_role.permissions = Permission.where(action: 'read')

  editor_role.permissions = Permission.where(
    action: %w[read create update destroy]
  )

  # 👉 Mantendo sua estrutura:
  admin_role.permissions = Permission.all

  puts "👥 Criando usuários..."

  admin_user = User.find_or_create_by!(email: 'apex@example.com') do |user|
    user.password = '9qacht'
    user.password_confirmation = '9qacht'
  end

  editor_user = User.find_or_create_by!(email: 'editor@example.com') do |user|
    user.password = 'editor123'
    user.password_confirmation = 'editor123'
  end

  viewer_user = User.find_or_create_by!(email: 'viewer@example.com') do |user|
    user.password = 'viewer123'
    user.password_confirmation = 'viewer123'
  end

  puts "🧩 Associando roles aos usuários..."

  admin_user.roles << admin_role unless admin_user.roles.include?(admin_role)
  editor_user.roles << editor_role unless editor_user.roles.include?(editor_role)
  viewer_user.roles << viewer_role unless viewer_user.roles.include?(viewer_role)

  puts "\n✅ Seeds finalizados!\n"
  puts "Admin:  apex@example.com / 9qacht"
  puts "Editor: editor@example.com / editor123"
  puts "Viewer: viewer@example.com / viewer123\n"
end
