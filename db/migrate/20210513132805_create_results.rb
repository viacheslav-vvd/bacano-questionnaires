class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.string :uid

      t.timestamps
    end
    add_index :results, :uid
  end
end
