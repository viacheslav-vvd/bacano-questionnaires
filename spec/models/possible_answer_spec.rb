require 'rails_helper'

RSpec.describe PossibleAnswer, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:value) }
    it { should validate_uniqueness_of(:position).scoped_to(:question_id) }
  end

  describe "Associations" do
    it { should belong_to(:question) }
  end
end
