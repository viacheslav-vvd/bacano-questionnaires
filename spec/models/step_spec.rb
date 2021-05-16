require 'rails_helper'

RSpec.describe Step, type: :model do
  let(:questionnaire) { Questionnaire.create!(name: 'name', slug: 'slug') }
  subject {
    described_class.new(position: 1, questionnaire_id: questionnaire.id)
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a position" do
      subject.position = nil
      expect(subject).not_to be_valid
    end
  
    it "cannot contain 2 records with the same questionnaire_id and position" do
      subject.save
      copy = subject.dup
      expect(copy).not_to be_valid
    end
  end
  
  describe "Associations" do
    it { should have_many(:questions) }
    it { should belong_to(:questionnaire) }
  end
end
