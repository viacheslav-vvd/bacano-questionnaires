class Result < ApplicationRecord
  belongs_to :questionnaire
  has_many :result_items
end
