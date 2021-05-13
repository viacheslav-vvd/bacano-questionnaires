class ResultItem < ApplicationRecord
  belongs_to :result
  belongs_to :question
end
