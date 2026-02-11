class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
    
    add_index :roles, :name, unique: true
    
    Role.create(name: 'admin', description: 'Administrador com acesso total')
    Role.create(name: 'editor', description: 'Editor de conteúdo')
    Role.create(name: 'viewer', description: 'Visualizador apenas')
  end
end
