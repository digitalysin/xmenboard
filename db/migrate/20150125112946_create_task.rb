class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :finished, default: false
      t.datetime :finished_at
      t.integer :owner_id
      t.integer :user_id
      t.timestamps
    end
  end
end
