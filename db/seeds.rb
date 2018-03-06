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

