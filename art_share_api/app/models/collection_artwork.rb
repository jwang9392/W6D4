# == Schema Information
#
# Table name: collection_artworks
#
#  id            :bigint           not null, primary key
#  artwork_id    :integer
#  collection_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionArtwork < ApplicationRecord
  belongs_to :artwork,
    class_name: 'Artwork',
    primary_key: :id,
    foreign_key: :artwork_id

  belongs_to :collection,
    class_name: 'Collection',
    primary_key: :id,
    foreign_key: :collection_id

end
