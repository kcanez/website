class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.string :brewery
      t.text :review
      t.string :style
      t.float :abv

      t.timestamps
    end
  end
end
