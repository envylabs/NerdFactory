class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string  :name,        :null => false
      t.text    :description
      t.decimal :price,       :null => false
      t.integer :category_id, :null => false
      t.boolean :new,         :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
