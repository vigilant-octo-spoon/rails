class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :user
      t.references :methodology
      t.float :score
      t.string :comment
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
