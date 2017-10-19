class CreateFollowsMethodologies < ActiveRecord::Migration[5.1]
  def change
    create_table :follows_methodologies do |t|
      t.references :user
      t.references :methodology

      t.timestamps
    end
  end
end
