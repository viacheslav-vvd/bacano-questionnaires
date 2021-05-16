require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Associations" do
    it { should belong_to(:result) }
    it { should belong_to(:question) }
  end
end
