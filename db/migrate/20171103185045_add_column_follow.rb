class AddColumnFollow < ActiveRecord::Migration[5.1]
  def change
    add_column :follows_methodologies, :step, :integer, default: 3
  end
end
