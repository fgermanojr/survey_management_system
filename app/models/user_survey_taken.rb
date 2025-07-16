class UserSurveyTaken < ApplicationRecord
  belongs_to :user, inverse_of: :user_survey_takens
  belongs_to :survey, inverse_of: :user_survey_takens
  has_many :option_responses, inverse_of: :user_survey_taken

  accepts_nested_attributes_for :option_responses, reject_if: :all_blank
end
