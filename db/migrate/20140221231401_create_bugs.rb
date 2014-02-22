class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :owner_id
      t.integer :page_id
      t.integer :assigned_to_id

      t.timestamps
    end
  end
end
