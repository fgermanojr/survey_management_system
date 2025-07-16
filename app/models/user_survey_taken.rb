class UserSurveyTaken < ApplicationRecord
  belongs_to :user, inverse_of: :user_survey_taken
  belongs_to :survey, inverse_of: :user_survey_taken
  has_many :option_responses, inverse_of: :user_survey_taken

  accept_nested_attributes_for :option_response
end
