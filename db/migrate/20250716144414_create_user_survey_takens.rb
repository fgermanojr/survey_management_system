class CreateUserSurveyTakens < ActiveRecord::Migration[8.0]
  def change
    create_table :user_survey_takens do |t|
      t.references :user, foreign_key: true
      t.references :survey, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
