class Screenshot < ActiveRecord::Base
  attr_accessible :image_url, :screenshotable_id, :screenshotable_type

  belongs_to :screenshotable, :polymorphic => true

  def self.build_screenshot(encoded_pic)
    image_file_name = "screenshot_#{Time.now.to_i}"
    image_data = Base64.decode64(encoded_pic['data:image/png;base64,'.length .. -1])
    File.open("#{Rails.root}/public/screenshots/#{image_file_name}.png", 'wb') do |f|
      f.write image_data
    end
    Screenshot.create(:image_url => image_file_name)
  end
end
