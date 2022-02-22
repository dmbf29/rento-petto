class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :species
      t.string :character
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
