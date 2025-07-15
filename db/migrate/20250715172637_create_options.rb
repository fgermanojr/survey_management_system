class CreateOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :options do |t|
      t.references :question 
      t.integer :row_index # row index on visible form
      t.string :option_text
      t.boolean :is_selected

      t.timestamps
    end
  end
end
