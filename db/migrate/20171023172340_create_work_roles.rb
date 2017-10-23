class CreateWorkRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :work_roles do |t|
      t.string      :name
      t.string      :role
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
