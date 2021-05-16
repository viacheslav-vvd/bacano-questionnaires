class Step < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions, dependent: :destroy
  
  validates :position, presence: true
  validates_uniqueness_of :position, scope: :questionnaire_id
end
