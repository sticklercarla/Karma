class CreateGiftItems < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_items do |t|
      t.string :item

      t.timestamps
    end
  end
end
