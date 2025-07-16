class Question < ApplicationRecord
  belongs_to :survey, foreign_key: 'survey_id'
  has_many :options

  accepts_nested_attributes_for :options, reject_if: :all_blank
end
