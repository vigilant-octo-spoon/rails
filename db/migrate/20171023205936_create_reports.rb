class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.text        :comment
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
