class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password

  has_secure_password

  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :created_invites, :class_name => 'Invite', :foreign_key => :inviter_id
  has_many :owned_tasks, :class_name => 'Task', :foreign_key => :owner_id
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => :assigned_to_id
  has_many :owned_bugs, :class_name => 'Bug', :foreign_key => :owner_id
  has_many :assigned_bugs, :class_name => 'Bug', :foreign_key => :assigned_to_id
end
