class CreateBroadcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :broadcasts do |t|
      t.string      :moment_of_implementation, default: 'Antes'
      t.string      :audience
      t.string      :diffusion_channel
      t.string      :objective
      t.references  :follows_methodologies
      t.timestamps
    end
  end
end
