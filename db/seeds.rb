# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserRestaurant.delete_all
Restaurant.delete_all
User.delete_all

PASSWORD = "supersecret"  

super_user = User.create(
    first_name: "Ayaka",
    username: "Aya",
    birth_date: "1988-12-26",
    sex: "female",
    email: "a@gmail.com",
    password: PASSWORD,
    is_admin: true,
    images:[]
    # ["https://image.shutterstock.com/image-photo/girl-playing-her-dog-golden-260nw-451774267.jpg"]
)
super_user2 = User.create(
    first_name: "Gabriel",
    username: "Boss",
    birth_date: "2000-01-01",
    sex: "male",
    email: "g@gmail.com",
    password: PASSWORD,
    is_admin: true,
    images:[]
    # ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lead-short-summer-haircut-gettyimages-492416565-1556829330.jpg?crop=0.494xw:0.987xh;0.324xw,0&resize=640:*"]
)


Restaurant.create(
    name: "White Spot Port Coquitlam",
    country: "Canada",
    state: "BC",
    city: "Port Coquitlam",
    zip_code: "V3B 7Z1",
    address: "2310 Ottawa St",
    phone_number: "604-468-4844",
    website: "whitespot.ca",
    images: []
)

Restaurant.create(
    name: "Joe Fortes Seafood & Chop House",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6E 3V5",
    address: "777 Thurlow St",
    phone_number: "604-669-1940",
    website: "joefortes.ca",
    images: []
)

Restaurant.create(
    name: "MeeT in Gastown",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6B 4K7",
    address: "12 Water St",
    phone_number: "604-696-1111",
    website: "meetonmain.com",
    images:[]
)

sex = ["female", "male", "other"].sample

10.times do
    first_name = Faker::Name.first_name
    username = Faker::Name.last_name
    user = User.create(
        first_name: first_name, 
        username: username,
        birth_date: "2000-01-01",
        sex: sex, 
        email: "#{first_name.downcase}@example.com",
        password: PASSWORD,
        images:[]
    )
    UserRestaurant.create(user_id: user.id, restaurant_id: Restaurant.all.sample.id)
end

users = User.all
puts Cowsay.say("Created #{users.count} users", :tux)
puts Cowsay.say("Created #{Restaurant.all.count} restaurants", :tux)
puts Cowsay.say("Login with #{super_user.email} and password of '#{PASSWORD}'", :cow)


