class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :length
      t.string :data
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :jobs, :users
  end
end
