class AddPlannings < ActiveRecord::Migration[5.1]
  def up
    create_table :plannings do |t|
      t.string      :initiative__name
      t.string      :objective
      t.string      :place
      t.date        :start_date
      t.date        :finish_date
      t.references  :follows_methodologies
    end
  end
end
