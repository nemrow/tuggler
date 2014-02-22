class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :description, :owner_id, :project_id, :status, :title

  belongs_to :page
  has_many :comments, :as => :commentable
  belongs_to :owner, :class_name => 'User'
  belongs_to :assigned_to, :class_name => 'User'
  has_many :screenshots, :as => :screenshotable
end
