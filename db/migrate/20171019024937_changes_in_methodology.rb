class ChangesInMethodology < ActiveRecord::Migration[5.1]
  def change
    remove_column :methodologies, :user_id
    remove_column :methodologies, :team_id
    add_column :methodologies, :author, :string
  end
end
