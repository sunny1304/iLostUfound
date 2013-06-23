class Reply < ActiveRecord::Base
  attr_accessible :comment_id, :reply, :user_id
  belongs_to :comment
  belongs_to :user
end
