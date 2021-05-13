class Questionnaire < ApplicationRecord
  has_many :steps
  has_many :results
end
