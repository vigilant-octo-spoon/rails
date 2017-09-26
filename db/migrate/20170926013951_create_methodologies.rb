class CreateMethodologies < ActiveRecord::Migration[5.1]
  def change
    create_table :methodologies do |t|
      t.string :title
      t.string :description
      t.reference :user
      t.reference :team

      t.timestamps
    end
  end
end
