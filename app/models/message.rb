class Message < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type, :message_from, :read, :read_at, :subject, :message_to
  belongs_to :user
  scope :unread, where(:read=>false)
end
