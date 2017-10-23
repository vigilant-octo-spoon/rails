class AddResources < ActiveRecord::Migration[5.1]
  def up
    create_table :resources do |t|
      t.string      :item
      t.boolean     :available, default: false
      t.text        :acquisition
      t.references  :follows_methodologies
    end
  end
end
