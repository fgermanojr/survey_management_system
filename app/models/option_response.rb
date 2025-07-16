class OptionResponse < ApplicationRecord
  belongs_to :question, inverse_of: :option_responses
  belongs_to :option, inverse_of: :option_responses
  belongs_to :user_survey_taken, inverse_of: :option_responses
end
