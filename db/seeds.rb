# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: "Carla", location: "Brooklyn", bio: "Livin' that coding lyfe.", pic: "http://www.carlastickler.com/uploads/8/0/0/0/80006612/leatherfullsize-1-of-1_2_orig.jpg", points: 0)

User.create(username: "Otha", password: "123", location: "Los Angeles", bio: "Living the dream", pic: "https://scontent-lga3-1.xx.fbcdn.net/v/t31.0-8/18489906_10155590311269494_5411898735160117300_o.jpg?_nc_cat=109&_nc_oc=AQlcfAhWaVrwid-XU9Bx3ZTSfknUKdR1Wuy9z5Y85rgm4ic18Phjp7fUQcWsoYEfyjQ&_nc_ht=scontent-lga3-1.xx&oh=13a0544eaaf5acbec63632a5a0022f79&oe=5DC6C036")
User.create(username: "Carla", password: "123", location: "Brooklyn", bio: "Living the lyfe", pic: "http://www.carlastickler.com/uploads/8/0/0/0/80006612/leatherfullsize-1-of-1_2_orig.jpg")
User.create(username: "Avi", password: "123", location: "NYC", bio: "Chillin")
