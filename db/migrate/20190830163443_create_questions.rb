class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :category_id
      t.string :ja_desc
      t.string :en_desc

      t.timestamps
    end
  end
end
