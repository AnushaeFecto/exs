
  # User.create!(email: "le@email.com", password: "123456")
  # Item.create!(user_id: 1, name: "bag", category: "Bags", size: "small", color: "blue", description: "blue pretty bag")
  # Item.create!(user_id: 1, name: "shoes", category: "Shoes", size: "3", color: "black", description: "black pretty shoes")
  # Item.create!(user_id: 1, name: "skirt", category: "Skirt", size: "large", color: "red", description: "red pretty skirt")
  # Item.create!(user_id: 1, name: "bag", category: "Bags", size: "large", color: "brown", description: "brown pretty bag")
  # Item.create!(user_id: 1, name: "bag", category: "Bags", size: "large", color: "yellow", description: "yellow pretty bag")
  # Item.create!(user_id: 1, name: "blouse", category: "Blouse", size: "small", color: "yellow", description: "yellow pretty blouse")
  # Item.create!(user_id: 1, name: "", category: "Trousers", size: "small", color: "blue", description: "blue pretty trousers")

puts "Cleaning db"
User.destroy_all
Item.destroy_all
Deal.destroy_all

puts "Creating users"
requester = User.create!(email: "1@abc.com", password: "123456")
answerer = User.create!(email: "2@abc.com", password: "123456")

puts "Creating items"
item = Item.create!(size: "1", color: "1", description: "1", category: "Dress", user: answerer)
item2 = Item.create!(size: "1", color: "1", description: "1", category: "Dress", user: answerer)
item3 = Item.create!(size: "1", color: "1", description: "1", category: "Dress", user: requester)

puts "Creating deal"
newdeal = Deal.new()
newdeal.requester_id = requester.id
newdeal.answerer_id = answerer.id
newdeal.save

puts "Adding items to deal"
deal_item1 = DealItem.create!(deal: newdeal, item: item)
deal_item2 = DealItem.create!(deal: newdeal, item: item3)
