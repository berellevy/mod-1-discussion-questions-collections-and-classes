require 'require_all'
require 'pry'

require_all '.'


# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

users = [
  "berel",
  "rochie",
  "avraham",
  "rivka",
  "mendy",
  "shaykie"
]

photos = [
  "poop",
  "breakfast",
  "lunch at th beach",
  "baby smiling",
  "the kids",
  "the parents"
]



users.each { |u| User.new(u)}

User.all.each { |u| u.add_photo(photos.shuffle[0]) }

User.all.each { |u| u.add_comment(photo: Photo.pick_random, text: "blah bidi blah") }
User.all.each { |u| u.add_comment(photo: Photo.pick_random, text: "blah bidi blah") }

User.all.each { |u| u.subscribe(User.pick_random) }


berel = User.all[0]
rochie = User.all[1]
rochie.add_photo("the kids")
the_kiids = Photo.all[0]
berel.add_comment(photo: the_kiids, text: "soooooo cute")


## need to write some more tests lol


binding.pry

sandwich_photo = Photo.new ##
sophie = User.new("Sophie")
sandwich_photo.user = sophie ##
sandwich_photo.user_name ##
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sophie.followers
# => person object

sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]