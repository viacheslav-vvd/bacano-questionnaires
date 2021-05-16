class AddIndexToResults < ActiveRecord::Migration[6.1]
  def change
    add_index :results, %i[questionnaire_id uid], unique: true
  end
end
