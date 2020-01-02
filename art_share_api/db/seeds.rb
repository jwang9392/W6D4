# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user_1 = User.create(username: 'van gogh')
user_2 = User.create(username: 'picasso')
user_3 = User.create(username: 'dan')

artwork_1 = Artwork.create(title: 'starry night', image_url: 'google.com', artist_id: user_1.id)
artwork_2 = Artwork.create(title: 'don kiote', image_url: 'bing.com', artist_id: user_2.id)

as_1 = ArtworkShare.create(artwork_id: artwork_1.id, viewer_id: user_3.id)
as_2 = ArtworkShare.create(artwork_id: artwork_1.id, viewer_id: user_2.id)
as_1 = ArtworkShare.create(artwork_id: artwork_2.id, viewer_id: user_3.id)
as_2 = ArtworkShare.create(artwork_id: artwork_2.id, viewer_id: user_1.id)

comment_1 = Comment.create(user_id: user_3.id, artwork_id: artwork_1.id, body: 'hmmmmm...')
comment_2 = Comment.create(user_id: user_3.id, artwork_id: artwork_2.id, body: 'hmmmmm...2')