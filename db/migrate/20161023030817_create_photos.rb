class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :post, index: true
      t.string :name
      t.string :path
      t.string :category
      t.timestamps
    end
  end
end
