class Bug < ActiveRecord::Base
  attr_accessible :assigned_to_id, :description, :owner_id, :status, :title

  belongs_to :page
  has_many :comments, :as => :commentable
  belongs_to :owner, :class_name => 'User'
  belongs_to :assigned_to, :class_name => 'User'
  has_many :screenshots, :as => :screenshotable

  def get_full_bug_content
    {
      :id => self.id,
      :description => self.description,
      :title => self.title,
      :status => self.status,
      :assigned_to => User.find_by_id(self.assigned_to_id),
      :owner => User.find_by_id(self.owner_id),
      :comments => self.comments,
      :screenshots => self.screenshots
    }
  end
end
