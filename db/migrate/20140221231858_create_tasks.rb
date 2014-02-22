class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :page_id
      t.integer :owner_id
      t.integer :assigned_to_id

      t.timestamps
    end
  end
end
