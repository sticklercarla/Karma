class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :location
      t.string :bio
      t.string :pic
      t.integer :points, default: 0
      t.string :password_digest

      t.timestamps
    end
  end
end
