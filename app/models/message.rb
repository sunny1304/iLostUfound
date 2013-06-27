class Message < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type, :message_from, :read, :read_at, :subject, :message_to
  belongs_to :user
  
  scope :unread, where(:read=>false)
  scope :kept_by_sender, where(:delete_by_sender => false)
  scope :kept_by_receiver, where(:delete_by_receiver => false)
end
