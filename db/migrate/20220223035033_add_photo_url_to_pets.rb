class AddPhotoUrlToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :photo_url, :string
  end
end
