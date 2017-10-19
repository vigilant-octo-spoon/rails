class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email, null: false, default: ""
      t.string :studies
      t.string :bio

      t.timestamps
    end
  end
end
