class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :author
      t.text :content

      t.references :slider

      t.timestamps null: false
    end
  end
end
