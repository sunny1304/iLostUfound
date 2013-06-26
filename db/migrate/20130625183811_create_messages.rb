class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :body
      t.integer :from
      t.integer :to
      t.datetime :read_at
      t.boolean :read
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
  end
end
