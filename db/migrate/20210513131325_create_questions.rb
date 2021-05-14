class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :step, null: false, foreign_key: true
      t.integer :position
      t.string :value
      t.integer :answer_type
      t.boolean :answer_required, default: true

      t.timestamps
    end
    add_index :questions, %i[step_id position], unique: true
  end
end
