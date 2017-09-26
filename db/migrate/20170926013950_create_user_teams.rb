class CreateUserTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teams do |t|
      t.reference :user
      t.reference :team

      t.timestamps
    end
  end
end
