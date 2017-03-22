class CreateShoppers < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :loyalty
      t.string :department

      t.timestamps
    end
  end
end
