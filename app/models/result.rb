class Result < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  
  validates :uid, presence: true
  validates_uniqueness_of :uid, scope: :questionnaire_id
end
