class AddBroadcasts < ActiveRecord::Migration[5.1]
  def up
    create_table :broadcasts do |t|
      t.string      :moment_of_implementation, default: 'Antes'
      t.string      :audience
      t.string      :diffusion_channel
      t.string      :objective
      t.references  :follows_methodologies
    end
  end
end
