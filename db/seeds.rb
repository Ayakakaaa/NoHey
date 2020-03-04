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
super_user3 = User.create(
    first_name: "Chris",
    username: "Thor",
    birth_date: "1983-08-11",
    sex: "male",
    email: "c@gmail.com",
    password: PASSWORD,
    is_admin: false,
    images:[]
    # ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lead-short-summer-haircut-gettyimages-492416565-1556829330.jpg?crop=0.494xw:0.987xh;0.324xw,0&resize=640:*"]
)
super_user4 = User.create(
    first_name: "Dwayne",
    username: "Johnson",
    birth_date: "1972-05-02",
    sex: "male",
    email: "d@gmail.com",
    password: PASSWORD,
    is_admin: false,
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
    lat: 49.2560713,
    lon: -122.7464027,
    phone_number: "604-468-4844",
    website: "whitespot.ca",
    images: []
)
Restaurant.create(
    name: "The Keg Steakhouse + Bar",
    country: "Canada",
    state: "BC",
    city: "Port Coquitlam",
    zip_code: "V6B 1N3",
    address: "688 Dunsmuir St",
    lat: 49.2760753,
    lon: -123.126459,
    phone_number: "604-685-7502",
    website: "kegsteakhouse.com",
    images: []
)

Restaurant.create(
    name: "Joe Fortes Seafood & Chop House",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6E 3V5",
    address: "777 Thurlow St",
    lat: 49.2849406,
    lon: -123.1247733,
    phone_number: "604-669-1940",
    website: "joefortes.ca",
    images: []
)
Restaurant.create(
    name: "Blue Water Cafe",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6B 5T4",
    address: "1095 Hamilton St",
    lat: 49.2754369,
    lon: -123.1625507,
    phone_number: "604-688-8078",
    website: "bluewatercafe.net",
    images: []
)
Restaurant.create(
    name: "Medina",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6B 3A4",
    address: "780 Richards St",
    lat: 49.280499,
    lon: -123.1190443,
    phone_number: "604-879-3114",
    website: "medinacafe.com",
    images: []
)
Restaurant.create(
    name: "Botanist",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6C 0B9",
    address: "1038 Canada Pl",
    lat: 49.2882223,
    lon: -123.1192751,
    phone_number: "604-695-5500",
    website: "botanistrestaurant.com",
    images: []
)
Restaurant.create(
    name: "Cactus Club Cafe Coal Harbour",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6C 3E1",
    address: "1085 Canada Pl",
    lat: 49.2760779,
    lon: -123.126459,
    phone_number: "604-620-7410",
    website: "cactusclubcafe.com",
    images: []
)
Restaurant.create(
    name: "JOEY Burrard",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6Z 1X9",
    address: "820 Burrard St",
    lat: 49.2827993,
    lon: -123.1253725,
    phone_number: "604-683-5639",
    website: "joeyrestaurants.com",
    images: []
)

Restaurant.create(
    name: "MeeT in Gastown",
    country: "Canada",
    state: "BC",
    city: "Vancouver",
    zip_code: "V6B 4K7",
    address: "12 Water St",
    lat: 49.2481866,
    lon: -123.1905705,
    phone_number: "604-696-1111",
    website: "meetonmain.com",
    images:[]
)

Restaurant.create(
    name: "Kai Japanese Restaurant",
    country: "Canada",
    state: "BC",
    city: "Port Coquitlam",
    zip_code: "V3B 0G9",
    address: "863 Village Dr #160",
    lat: 49.2764903,
    lon: -122.8498796,
    phone_number: "(604) 554-0282",
    website: "kairestaurant.ca",
    images:[]
)


Restaurant.create(
    name: "Brenda's French Soul Food",
    country: "USA",
    state: "CA",
    city: "San Francisco",
    zip_code: "94102",
    address: "652 Polk St",
    lat: 37.7838104,
    lon: -122.4173238,
    phone_number: "(415) 345-8100",
    website: "frenchsoulfood.com",
    images:[]
)

Restaurant.create(
    name: "MONTESACRO Pinseria SF",
    country: "USA",
    state: "CA",
    city: "San Francisco",
    zip_code: "94103",
    address: "510 Stevenson St",
    lat: 37.7931879,
    lon: -122.3976471,
    phone_number: "(415) 795-3040",
    website: "montesacrosf.com",
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
        email: "#{first_name.downcase}@gmail.com",
        password: PASSWORD,
        images:[]
    )
    UserRestaurant.create(user_id: user.id, restaurant_id: Restaurant.all.sample.id)
end

users = User.all
puts Cowsay.say("Created #{users.count} users", :tux)
puts Cowsay.say("Created #{Restaurant.all.count} restaurants", :tux)
puts Cowsay.say("Login with #{super_user.email} and password of '#{PASSWORD}'", :cow)


