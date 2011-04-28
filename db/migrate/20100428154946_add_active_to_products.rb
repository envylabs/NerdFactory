class AddActiveToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :active, :boolean, :default => true, :nil => false
  end

  def self.down
    remove_column :products, :active
  end
end
