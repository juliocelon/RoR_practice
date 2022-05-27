class AddTodoReferenceToPhotos < ActiveRecord::Migration[7.0]
  def change
    # Photo.destroy_all
    add_reference :photos, :todo, null: false, foreign_key: true
  end
end
