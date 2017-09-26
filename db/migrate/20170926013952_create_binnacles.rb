class CreateBinnacles < ActiveRecord::Migration[5.1]
  def change
    create_table :binnacles do |t|
      t.string :content
      t.reference :methodology

      t.timestamps
    end
  end
end
