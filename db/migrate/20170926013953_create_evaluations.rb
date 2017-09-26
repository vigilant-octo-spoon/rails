class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.reference :user
      t.reference :methodology
      t.double :score
      t.string :comment

      t.timestamps
    end
  end
end
