class AddWorkRoles < ActiveRecord::Migration[5.1]
  def up
    create_table :work_roles do |t|
      t.string      :name
      t.string      :role
      t.references  :follows_methodologies
    end
  end
end
