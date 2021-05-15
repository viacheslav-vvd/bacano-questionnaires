class AddMinMaxValueToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :min_value, :integer
    add_column :questions, :max_value, :integer
  end
end
