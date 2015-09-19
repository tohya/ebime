class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :user_projects, :user_id
    add_index :user_projects, :project_id
    add_index :user_projects, [:user_id, :project_id], unique: true
  end
end
