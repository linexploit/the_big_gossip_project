require "faker"

# User.destroy_all
# Gossip.destroy_all

#créer 10 villes aléatoires
cities = []
10.times do
    city= City.create!(name: Faker::Address.city, zip_code: Faker::Address.postcode)
    cities << city
end

#créer 10 utilisateurs aléatoires
users = []
10.times do
    user = User.create!(username: Faker::Name.first_name, bio: Faker::Lorem.paragraph(sentence_count: 5), email: Faker::Internet.email, age: Faker::Number.between(from: 13, to: 60), city: City.all.sample,  password: 'password123')
    users << user
end


#créer 10 gossips aléatoires
gossips = []
20.times do
    gossip = Gossip.create!(title: Faker::Movie.title[0..13], content: Faker::ChuckNorris.fact, user: users.sample, city: cities.sample)
    gossips << gossip
end

#vérifier l'insertion et l'attribution users/gossips
# users[0].gossips #changer l'index si pas de gossips

# #créer 10 tags aléatoires
# tags = []
# 10.times do
#     tag = Tag.create!(name: Faker::Lorem.words(number: 1), user: users.sample)
#     tags << tag
# end

# #attribuer 10 tags aléatoires à un ou plusieurs gossips
# 10.times do
#     gossiptag = GossipTag.create!(gossip: gossips.sample, tag: tags.sample)
# end

# #vérifier tags du user index 0 et du gossip index 0
# users[0].tags
# gossips[0].tags

#vérifier la ville de user index 5
# users[5].city

#création de 25 messages aléatoires + attribution d'un destinataire obligatoire
# messages = []
# 25.times do
#     message = Message.create!(user: users.sample, message: Faker::Lorem.paragraph(sentence_count:5))
#     recipient = Recipient.create(user: users.sample, message: message)
#     messages << message
# end

#attribution de plusieurs messages avec un ou plusieurs destinataires
# 25.times do
#     recipient = Recipient.create(user: users.sample, message: messages.sample)
# end

#vérifier la ville du user à l'index 5
# puts users[5].city.name

# #vérifier les messages du user à l'index 5
# users[5].messages.each do |message|
#     puts message.message
# end

# #vérifier les destinataires de chaque message de l'user index 5 | !!! comme les messages sont attribués au hasard, certains messages n'ont pas de destinataire
# messages[5].users.each do |user|
#     puts user.first_name
# end
