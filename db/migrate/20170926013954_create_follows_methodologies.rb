class CreateFollowsMethodologies < ActiveRecord::Migration[5.1]
  def change
    create_table :follows_methodologies do |t|
      t.reference :user
      t.reference :methodology

      t.timestamps
    end
  end
end
