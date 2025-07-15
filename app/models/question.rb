class Question < ApplicationRecord
  belongs_to :survey, foreign_key: 'survey_id'
  has_many :options
end
