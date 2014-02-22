class Screenshot < ActiveRecord::Base
  attr_accessible :image_url, :screenshotable_id, :screenshotable_type

  belongs_to :screenshotable, :polymorphic => true
end
