require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:questionnaire) { Questionnaire.create!(name: 'name', slug: 'slug') }
  subject {
    described_class.new(uid: 'uid' + Time.now.to_i.to_s, questionnaire_id: questionnaire.id)
  }
  describe "Validations" do
    it { should validate_presence_of(:uid) }

    it "cannot contain 2 records with the same questionnaire_id and position" do
      subject.save
      copy = subject.dup
      expect(copy).not_to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:questionnaire) }
    it { should have_many(:answers) }
  end
end
