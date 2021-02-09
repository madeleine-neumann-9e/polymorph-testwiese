class CreateButtons < ActiveRecord::Migration[6.0]
  def change
    create_table :buttons do |t|
      t.string :title
      t.integer :button_type

      t.timestamps
    end
  end
end
