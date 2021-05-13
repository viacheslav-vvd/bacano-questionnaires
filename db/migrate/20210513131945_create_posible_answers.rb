class CreatePosibleAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :posible_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
    add_index :posible_answers, %i[question_id position], unique: true
  end
end
