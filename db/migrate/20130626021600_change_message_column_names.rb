class ChangeMessageColumnNames < ActiveRecord::Migration
  def up
  	rename_column :messages, :from, :message_from
  	rename_column :messages, :to,   :message_to
  end

  def down
  	rename_column :messages, :message_from, :from
  	rename_column :messages, :message_to,   :to
  end
end
