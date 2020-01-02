# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean
#

class ArtworkShare < ApplicationRecord

  belongs_to :viewer, 
    class_name: 'User',
    foreign_key: :viewer_id

  belongs_to :artwork


end
