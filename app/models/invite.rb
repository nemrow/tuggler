class Invite < ActiveRecord::Base
  attr_accessible :active, :email, :inviter_id, :project_id

  belongs_to :inviter, :class_name => 'User'
  belongs_to :project
end
