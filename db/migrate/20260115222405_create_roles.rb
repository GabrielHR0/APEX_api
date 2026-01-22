class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
    
    add_index :roles, :name, unique: true
    
    # Roles padrão
    Role.create(name: 'admin', description: 'Administrador com acesso total')
    Role.create(name: 'editor', description: 'Editor de conteúdo')
    Role.create(name: 'viewer', description: 'Visualizador apenas')
  end
end
