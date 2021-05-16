class Question < ApplicationRecord
  belongs_to :step
  has_many :possible_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  
  validates :value, :answer_type, :position, presence: true
  validates_uniqueness_of :position, scope: :step_id
  
  enum answer_type: %w[STRING INTEGER RADIO CHECKBOXES]
end
