# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean
#

class Artwork < ApplicationRecord
  
  validates :title, uniqueness: { scope: :artist_id,
    message: "should happen once per artist" }
  
  belongs_to :artist,
    class_name: 'User',
    foreign_key: :artist_id

  has_many :artwork_shares,
    class_name: 'ArtworkShare',
    primary_key: :id,
    foreign_key: :artwork_id

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :artwork_id,
    dependent: :destroy

  has_many :likes,
    :as => :likeable

  has_many :collection_artworks,
    class_name: 'CollectionArtwork',
    primary_key: :id,
    foreign_key: :artwork_id

  has_many :collections,
    through: :collection_artworks,
    source: :collection
end
