class Result < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
end
