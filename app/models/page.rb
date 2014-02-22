class Page < ActiveRecord::Base
  attr_accessible :route

  has_many :tasks
  has_many :bugs
end
