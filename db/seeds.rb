requester = User.new

answerer = User.new

Item.new

deal = Deal.new()
deal.requester_id = requester.id
deal.answerer_id = answerer.id

deal.save
