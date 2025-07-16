class Question < ApplicationRecord
  belongs_to :survey, foreign_key: 'survey_id', inverse_of: :questions
  has_many :options, inverse_of: :question
  has_many :option_responses, inverse_of: :question

  accepts_nested_attributes_for :options, reject_if: :all_blank
end
