class User < ApplicationRecord
  has_secure_password :password, validations: true
  validates :email, presence: true, uniqueness: true

  has_many :created_surveys, class_name: 'Survey'
end
