# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES),
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }
user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}

@res_arr = [res1, res2]
@user_arr = [user1, user2]


#gets average rating of a resturant
def average_rating(res)
  #this array is to store all of the reviews ratings
  avg = []
  #For each review a res has it goes in and takes the rating and throws it into the array
  res[:reviews].each do |num|
    avg.push num[:rating]
  end
  #Then we can display the average
  puts "Average Rating: #{avg.sum / avg.length}"
end

def full_menu(foods)
  foods.each do |food|
  puts "#{food[:name]}  ----------------    $#{food[:price]}\n"
  puts "      Ingredients:"
  food[:ingredients].each do |ingredient|
    puts "          #{ingredient}" 
  end
  puts""
end
end

#It knows what resturant to look for because the resturant is the parameter
#This method puts out the location by going into the resurant hash then the location hash then it grabs the city. 
#And then is does the same thing for the state

def location(res)
  puts "Location: #{res[:location][:city]}, #{res[:location][:state]}"
end


def price_filter(res)
  puts "What is your price limit?"
  max_price = gets.chomp.to_i
  options = res[:dishes].select {|i| i[:price] <= max_price }
  full_menu(options)
end

#Displays the days that a res is open
def display_days_open(res)
  #Since the info we want to print is a string I split it on the comma so I have more control over it
  days_open_arr = res[:days_open].split (",")
  #If the res is open 7 days a week it prints that
  if days_open_arr.length == 7
    puts "Open 7 Days A Week"
  else
    days_open_arr.each do |day|
      print "#{day}, "
    end
  end
end

#This function ties everything together to display the info
def display_res_info(res)
  puts "#{res[:name]}"
  location(res)
  average_rating(res)
  display_days_open(res)
  puts "----------"
  price_filter(res)
end


puts "What resturant would you like to view?"
@res_arr.each_with_index do |res, i| 
  puts "#{i+1}) #{res[:name]}"
  puts average_rating(res)

end

case gets.chomp.to_i

when 1
  puts "dope"
when 2
  puts "dope"
end







