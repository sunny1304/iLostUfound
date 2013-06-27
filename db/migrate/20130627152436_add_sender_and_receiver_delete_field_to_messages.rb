class AddSenderAndReceiverDeleteFieldToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :delete_by_sender,   :boolean, :default => false
  	add_column :messages, :delete_by_receiver, :boolean, :default => false
  end
end
