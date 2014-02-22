class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :route
      t.integer :project_id

      t.timestamps
    end
  end
end
