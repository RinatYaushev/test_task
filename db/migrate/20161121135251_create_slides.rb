class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.attachment :image

      t.references :slider

      t.timestamps null: false
    end
  end
end
