class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.references :question, null: false
      t.timestamps
    end
  end
end
