class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string      :item
      t.boolean     :available, default: false
      t.text        :acquisition
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
