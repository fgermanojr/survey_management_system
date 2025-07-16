class Option < ApplicationRecord
  belongs_to :question, foreign_key: 'question_id', inverse_of: :options
  has_many :option_responses, inverse_of: :option
end
