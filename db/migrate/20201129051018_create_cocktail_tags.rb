class CreateCocktailTags < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_tags do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
