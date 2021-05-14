class Question < ApplicationRecord
  belongs_to :step
  has_many :possible_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  
  validates :value, presence: true
  
  enum answer_type: %w[STRING INTEGER RADIO CHECKBOXES]
end
