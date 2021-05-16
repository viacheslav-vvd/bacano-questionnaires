require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  subject {
    described_class.new(name: 'Name', slug: 'slug')
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end
    
    it "is not valid without a slug" do
      subject.slug = nil
      expect(subject).not_to be_valid
    end
  
    it "cannot contain 2 records with the same slug" do
      subject.save
      copy = subject.dup
      copy.name = 'new name'
      expect(copy).not_to be_valid
    end
  end
  
  describe "Associations" do
    it { should have_many(:steps) }
    it { should have_many(:results) }
  end
end
