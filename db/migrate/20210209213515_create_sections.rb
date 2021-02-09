class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :page, null: false, foreign_key: true
      t.references :content_element, polymorphic: true, null: false
      t.integer :order, null: false, default: 0

      t.timestamps
    end
  end
end
