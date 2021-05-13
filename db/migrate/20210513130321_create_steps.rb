class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
    add_index :steps, %i[questionnaire_id position], unique: true
  end
end
