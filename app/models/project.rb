class Project < ActiveRecord::Base
  attr_accessible :host_name

  has_many :user_projects
  has_many :users, :through => :user_projects
  has_many :invites
  has_many :pages
end
