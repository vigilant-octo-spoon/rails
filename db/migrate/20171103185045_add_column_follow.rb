class AddColumnFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows_methodologies, :step, :integer
  end
end
