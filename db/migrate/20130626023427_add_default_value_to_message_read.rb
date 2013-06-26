class AddDefaultValueToMessageRead < ActiveRecord::Migration
  def change
  	remove_column :messages,:read
  	add_column :messages, :read, :boolean, :default => false
  end
end
