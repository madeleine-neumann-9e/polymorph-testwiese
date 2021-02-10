class CreateContentElements < ActiveRecord::Migration[6.0]
  def change
    create_table :content_elements do |t|
      t.references :page, null: false, foreign_key: true
      t.references :content_element_type, polymorphic: true, null: false, index: {name: "index__on_content_element_type_and_content_element_id"}
      t.integer :order, null: false, default: 0

      t.timestamps
    end
  end
end
