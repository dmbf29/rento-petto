class RemovePhotoFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :photo, :string
  end
end
