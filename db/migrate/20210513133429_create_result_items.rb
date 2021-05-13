class CreateResultItems < ActiveRecord::Migration[6.1]
  def change
    create_table :result_items do |t|
      t.references :result, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.json :answer

      t.timestamps
    end
  end
end
