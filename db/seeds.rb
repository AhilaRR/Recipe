# Create Users
user1 = User.create!(email: 'user1@example.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password')

# Create Categories
italian = Category.create!(name: 'Italian')
mexican = Category.create!(name: 'Mexican')
dessert = Category.create!(name: 'Dessert')

# Create Recipes
Recipe.create!([
  {
    title: 'Spaghetti Carbonara',
    ingredients: 'Pasta, Eggs, Parmesan Cheese, Bacon',
    instructions: 'Cook pasta. Mix eggs and cheese. Combine pasta with egg mixture and cooked bacon.',
    user: user1,
    categories: [italian]
  },
  {
    title: 'Tacos',
    ingredients: 'Tortillas, Ground Beef, Cheese, Lettuce, Tomato',
    instructions: 'Cook ground beef. Fill tortillas with beef and toppings.',
    user: user2,
    categories: [mexican]
  },
  {
    title: 'Chocolate Cake',
    ingredients: 'Flour, Sugar, Cocoa Powder, Baking Powder, Eggs',
    instructions: 'Mix dry ingredients. Add eggs and mix. Bake at 350 degrees for 30 minutes.',
    user: user1,
    categories: [dessert]
  }
])

puts "Seed data loaded!"
