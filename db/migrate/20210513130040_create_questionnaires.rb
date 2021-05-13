class CreateQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :questionnaires, :slug, unique: true
  end
end
