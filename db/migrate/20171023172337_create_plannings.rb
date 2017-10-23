class CreatePlannings < ActiveRecord::Migration[5.1]
  def change
    create_table :plannings do |t|
      t.string      :initiative_name
      t.string      :objective
      t.string      :place
      t.date        :start_date
      t.date        :finish_date
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
