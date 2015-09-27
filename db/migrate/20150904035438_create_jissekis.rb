class CreateJissekis < ActiveRecord::Migration
  def change
    create_table :jissekis do |t|
      t.integer  :user_project_id
      t.datetime :date
      t.decimal  :time
      t.integer  :approval_status

      t.timestamps
    end
    add_index :jissekis, [:user_project_id, :created_at]
  end
end
