class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.reference :user
      t.reference :methodology
      t.string :comment

      t.timestamps
    end
  end
end
