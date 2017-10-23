class AddConditions < ActiveRecord::Migration[5.1]
  def up
    create_table :conditions do |t|
      t.string      :item
      t.text        :info
      t.references  :follows_methodologies
    end
  end
end
