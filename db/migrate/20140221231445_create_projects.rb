class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :host_name

      t.timestamps
    end
  end
end
