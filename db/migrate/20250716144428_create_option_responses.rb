class CreateOptionResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :option_responses do |t|
      t.references :user_survey_taken, foreign_key: true
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true
      t.boolean :option_selected

      t.timestamps
    end
  end
end
