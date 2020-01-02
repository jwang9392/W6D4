class CreateCollectionArtwork < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_artworks do |t|
      t.integer :artwork_id
      t.integer :collection_id

      t.timestamps
    end

    add_index :collection_artworks, :artwork_id
    add_index :collection_artworks, :collection_id
    add_index :collection_artworks, [:artwork_id, :collection_id], unique: true
  end
end
