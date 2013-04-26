class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :website
      t.string :phone
      t.boolean :wifi
      t.boolean :groups

      t.timestamps
    end
  end
end
