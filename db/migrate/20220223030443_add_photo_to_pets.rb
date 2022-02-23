class AddPhotoToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :photo, :string
  end
end
