class ChangesInEvaluations < ActiveRecord::Migration[5.1]
  def change
    remove_column :evaluations, :user_id
    remove_column :evaluations, :methodology_id
    remove_column :evaluations, :score
    remove_column :evaluations, :comment
    add_column :evaluations, :comments_connect, :text
    add_column :evaluations, :comments_select, :text
    add_column :evaluations, :comments_planning, :text
    add_column :evaluations, :comments_implementation, :text
    add_column :evaluations, :users_reflection, :text
    add_column :evaluations, :users_suggestions, :text
  end
end
