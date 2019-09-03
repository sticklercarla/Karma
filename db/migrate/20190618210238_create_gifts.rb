class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.integer :gift_item_id

      t.timestamps
    end
  end
end
