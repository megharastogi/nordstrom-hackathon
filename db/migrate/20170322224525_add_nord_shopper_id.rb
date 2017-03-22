class AddNordShopperId < ActiveRecord::Migration[5.0]
  def change
  	add_column :shoppers, :nord_shopper_id, :string
  end
end
