class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :image_url
      t.integer :screenshotable_id
      t.string :screenshotable_type

      t.timestamps
    end
  end
end
