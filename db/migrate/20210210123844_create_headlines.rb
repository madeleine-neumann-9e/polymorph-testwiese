class CreateHeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :headlines do |t|
      t.string :title
      t.integer :title_type

      t.timestamps
    end
  end
end
