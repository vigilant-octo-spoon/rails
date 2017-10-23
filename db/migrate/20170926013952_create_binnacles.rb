class CreateBinnacles < ActiveRecord::Migration[5.1]
  def change
    create_table :binnacles do |t|
      t.date        :start_date
      t.date        :finish_date
      t.text        :objectives
      t.text        :observations
      t.text        :advances
      t.text        :obstacles
      t.text        :ideas
      t.references :follows_methodologies

      t.timestamps
    end
  end
end
