class Survey < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :questions
  has_many :options, :through => :questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank
  accepts_nested_attributes_for :options, reject_if: :all_blank
end
