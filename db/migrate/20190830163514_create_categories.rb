class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :ja_desc
      t.string :en_desc

      t.timestamps
    end
  end
end
