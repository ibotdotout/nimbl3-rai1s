class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :job, index: true
      t.string :keyword
      t.integer :keyword_index
      t.integer :top_adword
      t.integer :right_adword
      t.integer :total_adword
      t.integer :none_adword
      t.integer :total_link
      t.string :total_search
      t.text :top_adword_url, array: true, default: []
      t.text :right_adword_url, array: true, default: []
      t.text :none_adword_url, array: true, default: []
      t.text :page
      t.timestamps null: false
    end
    add_foreign_key :reports, :jobs
  end
end
