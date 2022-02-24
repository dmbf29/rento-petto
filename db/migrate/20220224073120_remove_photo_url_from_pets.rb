class RemovePhotoUrlFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :photo_url, :string
  end
end
