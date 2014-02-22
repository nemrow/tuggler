class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :inviter_id
      t.integer :project_id
      t.boolean :active

      t.timestamps
    end
  end
end
