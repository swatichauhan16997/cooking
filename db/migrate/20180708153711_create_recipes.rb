class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.boolean :type
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
