class PossibleAnswer < ApplicationRecord
  belongs_to :question
  
  validates :value, :position, presence: true
  validates_uniqueness_of :position, scope: :question_id
end
