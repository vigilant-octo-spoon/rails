class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.string      :item
      t.text        :info
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
