class AddShopToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :shop_id, :integer
  end
end
