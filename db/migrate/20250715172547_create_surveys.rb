class CreateSurveys < ActiveRecord::Migration[8.0]
  def change
    create_table :surveys do |t|
      t.references :user
      t.string :survey_text
      t.text :description

      t.timestamps
    end
  end
end
