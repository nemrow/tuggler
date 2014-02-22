class Page < ActiveRecord::Base
  attr_accessible :route

  has_many :tasks
  has_many :bugs

  def get_full_page_hash(user)
    {
      :status => 'success',
      :bugs => self.bugs.map{|bug| bug.get_full_bug_content},
      :tasks => self.tasks.map{|task| task.get_full_task_content}
    }
  end
end
