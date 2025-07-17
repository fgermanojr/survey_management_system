class Survey < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :questions
  has_many :options, :through => :questions
  has_many :user_survey_takens, inverse_of: :survey

  accepts_nested_attributes_for :questions, reject_if: :all_blank
  accepts_nested_attributes_for :options, reject_if: :all_blank

  def construct_results_tally
    result = []
    @survey.questions.each_with_index do |q, qid|
      result[qid] = []
      q.option_responses.each_with_index do |o, oid|
        result[qid][oid] ||= 0
        result[qid][oid] += 1 if o.is_selected
      end
    end

    result
  end
end
