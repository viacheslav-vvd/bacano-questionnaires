class Questionnaire < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :results, dependent: :destroy
  
  validates :name, :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  
  before_save { |record| record.slug = record.slug.gsub(/[[:space:]]/, '').downcase }
end
