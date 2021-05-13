class Question < ApplicationRecord
  belongs_to :step
  has_many :posible_answers
  has_many :result_items
end
