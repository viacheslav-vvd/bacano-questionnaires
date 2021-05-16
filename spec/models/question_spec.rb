require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:answer_type) }
  end

  describe "Associations" do
    it { should belong_to(:step) }
    it { should have_many(:possible_answers) }
  end
end
