class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :catchcopy
      t.string :image_id

      t.timestamps
    end
  end
end
