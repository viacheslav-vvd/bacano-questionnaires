class CreatePossibleAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :possible_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :position
      t.string :value

      t.timestamps
    end
    add_index :possible_answers, %i[question_id position], unique: true
  end
end
