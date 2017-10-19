class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.references :methodology
      t.string :comment

      t.timestamps
    end
  end
end
