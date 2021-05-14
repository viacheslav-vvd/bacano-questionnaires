class Questionnaire < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :results, dependent: :destroy
  
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
