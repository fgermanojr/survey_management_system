class RemoveIsSelectedFromOptions < ActiveRecord::Migration[8.0]
  def change
    remove_column :options, :is_selected
  end
end
