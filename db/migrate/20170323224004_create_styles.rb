class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :brandName
      t.string :imageURL
      t.string :styleID
      t.integer :shopper_id

      t.timestamps
    end
  end
end
