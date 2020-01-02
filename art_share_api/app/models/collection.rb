# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collection < ApplicationRecord
  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :collection_artworks,
    class_name: 'CollectionArtwork',
    primary_key: :id,
    foreign_key: :collection_id,
    dependent: :destroy

  has_many :artworks,
    through: :collection_artworks,
    source: :artwork
end
