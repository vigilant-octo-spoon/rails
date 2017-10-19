class CreateMethodologies < ActiveRecord::Migration[5.1]
  def change
    create_table :methodologies do |t|
      t.string :title
      t.string :description
      t.references :user
      t.references :team

      t.timestamps
    end
  end
end
