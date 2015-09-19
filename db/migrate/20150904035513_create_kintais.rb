class CreateKintais < ActiveRecord::Migration
  def change
    create_table :kintais do |t|
      t.integer  :user_id
      t.datetime :date
      t.time     :time
      t.integer  :approval_status

      t.timestamps
    end
    add_index :kintais, [:user_id, :created_at]
  end
end
