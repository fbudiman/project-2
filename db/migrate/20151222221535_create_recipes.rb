class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :user_id
      t.integer :restaurant_id
      t.text :body
      t.integer :likes
      t.integer :comments

      t.timestamps null: false
    end
    change_column(:recipes, :likes, :integer, { default: 0 })
    change_column(:recipes, :comments, :integer, { default: 0 })
  end
end
