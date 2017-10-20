class AddColumnsToMethodology < ActiveRecord::Migration[5.1]
  def change
    add_column :methodologies, :link_video, :string
    add_column :methodologies, :category, :string
    add_column :methodologies, :organization, :string
  end
end
