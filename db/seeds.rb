# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Beach', priority: 1)
Category.create(name: 'Nature', priority: 2)
Category.create(name: 'Resorts', priority: 3)
Category.create(name: 'Adventure', priority: 4)
Category.create(name: 'Mountain', priority: 5)

User.create(name: 'Marcelo', username: 'marcelomaidden@gmail.com')
User.create(name: 'Steven', username: 'steven@gmail.com')
User.create(name: 'Carlos', username: 'carlos@gmail.com')
User.create(name: 'Arturo', username: 'arturo@gmail.com')
User.create(name: 'Mir', username: 'mir@gmail.com')
User.create(name: 'Imran', username: 'imran@gmail.com')

Article.create(author_id:1, title: 'Maldives, the best island for honeymoon', 
  text: 'Maldives, a destination consisting of 26 oval-shaped atolls & over 1,000 coral islands, 
  has established a reputation for itself as one of the exotic honeymoon destinations, 
  and for a good reason. The destination has a large number of privately owned artificial 
  resort islands, created especially to cater to those looking for a romantic vacation. 
  And the newlyweds across the globe seek one or more of the best islands in Maldives for honeymoon. 
  Though Maldives is not as big in size as them other honeymoon destinations in Asia, 
  it never disappoints the hopeless romantics. And the credit goes to its stunning white-sand 
  beaches, turquoise lagoons, beautiful corals, and chic overwater villas. Maldives features 
  landscapes that match the picture of our dream honeymoon location. This is where the newly-weds 
  get to enjoy the privileges’ of all the comforts of the modern world along with the privacy 
  from the bustling modern cities.',
  photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/maldives.jpg", 'image/png'))

ArticleCategory.create(article_id: 1, category_id: 1)
ArticleCategory.create(article_id:2, category_id: 2)
ArticleCategory.create(article_id:2, category_id: 3)

Vote.create(article_id: 1, user_id: 2)
Vote.create(article_id: 1, user_id: 3)
Vote.create(article_id: 1, user_id: 4)
Vote.create(article_id: 1, user_id: 5)
Vote.create(article_id: 1, user_id: 6)

Article.create(author_id:2, title: 'Male Island: Best Island In Maldives',
  text: 'Male is the best island in Maldives for honeymoon for all those luxury-seeker couples. 
  It is on this island that the major international airport of Maldives is located and you should
   ideally visit this island at the very beginning or the end of your honeymoon in Maldives. 
   Though it is often dismissed as a destination with little sightseeing options, 
   it must not be missed. For it is here that you experience the true
   Maldivian culture and it is the best island to stay in Maldives for honeymoon.',
   photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/male_islands.jpg", 'image/png'))

ArticleCategory.create(article_id:2, category_id: 1)
ArticleCategory.create(article_id:2, category_id: 2)

Vote.create(article_id: 2, user_id: 3)
Vote.create(article_id: 2, user_id: 4)
Vote.create(article_id: 2, user_id: 5)

Article.create(author_id: 3, title: 'Fihalhohi Island: Beauty And Romance',
  text: 'Situated in the Kaafu Atoll of South Mal-, is among the most beautiful places to visit in Maldives for the honeymooners. The Fihalhohi Island Resort here is, in fact, is one of the most romantic Maldives island resorts that has a number of overwater bungalows to stay in.

  Best experiences: In addition to its well-equipped overwater properties, 
  its Palm Groove, Aeolus Dive Centre, and Anggerik Spa make the Fihalhohi Island Resort a 
  splendid stay option. And the pristine beaches on the island that shaded by coconut palm trees 
  are truly romantic.',
  photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/fihalhohi.jpg", 'image/png')
)

ArticleCategory.create(article_id: 3, category_id: 1)
ArticleCategory.create(article_id: 3, category_id: 3)

Vote.create(article_id: 3, user_id: 5)

Article.create(author_id: 4, 
  title: 'A Honeymoon in Arunachal Pradesh',
text: 'You have met your soulmate, and the special day in both of your life is to arrive soon.
 The big fat wedding in your life brings with it lots of chaos and everything seems to spiral 
 out of proportion at the nick of the moment. Sometimes the wedding venue is not up to the mark 
 and somewhere else the perfect dress is still a mystery. Amidst all these confusions the last 
 thing that craves for your attention is the “Honeymoon”. After all, it is the only time away 
 from the mayhem in which both life partners get to spend time with each other. 
 There are various destinations suitable 
for a honeymoon in Arunachal Pradesh that makes this state best for a romantic escapade.',
photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/honeymoon.jpg", 'image/png'))

ArticleCategory.create(article_id: 4, category_id: 2)
ArticleCategory.create(article_id: 4, category_id: 4)
ArticleCategory.create(article_id: 4, category_id: 5)

Vote.create(article_id: 4, user_id: 5)
Vote.create(article_id: 4, user_id: 3)


Article.create(author_id: 4, 
  title: 'What is rights of nature',
text: 'Rights of Nature is the recognition and honoring that Nature has rights.  
It is the recognition that our ecosystems – including trees, oceans, animals, mountains – have 
rights just as human beings have rights. Rights of Nature is about balancing what is good for
 human beings against what is good for other species, what is good for the planet as a world. 
  It is the holistic recognition that all life, all ecosystems on our planet are deeply intertwined.

Rather than treating nature as property under the law, rights of nature acknowledges that nature in all its life forms has the right to exist, persist, maintain and regenerate its vital cycles.',
photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/turkey.jpg", 'image/png'))

ArticleCategory.create(article_id: 5, category_id: 4)
ArticleCategory.create(article_id: 5, category_id: 5)



Vote.create(article_id: 5, user_id: 3)

Article.create(author_id: 4, 
  title: 'Learn about rights of nature',
text: 'Rights of Nature is the recognition and honoring that Nature has rights.  
It is the recognition that our ecosystems – including trees, oceans, animals, mountains – have 
rights just as human beings have rights. Rights of Nature is about balancing what is good for
 human beings against what is good for other species, what is good for the planet as a world. 
  It is the holistic recognition that all life, all ecosystems on our planet are deeply intertwined.

Rather than treating nature as property under the law, rights of nature acknowledges that nature in all its life forms has the right to exist, persist, maintain and regenerate its vital cycles.',
photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/nature.jpg", 'image/png'))

ArticleCategory.create(article_id: 5, category_id: 4)
ArticleCategory.create(article_id: 5, category_id: 5)


Vote.create(article_id: 6, user_id: 1)


Article.create(author_id: 4, 
  title: 'Spending time in nature can boost overall well-being, but how much exposure do we need? 
  A new study concludes that 2 hours each week is enough to reap the benefits, 
  though significant questions remain.In Western society, as overall interaction with nature slowly declines, scientists are exploring whether reconnecting with parks, 
  woodlands, and beaches might benefit our general health and well-being.',
photo: Rack::Test::UploadedFile.new("#{Rails.root}/db/seeds_images/man-walking-dog.jpg", 'image/png'))

ArticleCategory.create(article_id: 6, category_id: 4)
ArticleCategory.create(article_id: 6, category_id: 5)


Vote.create(article_id: 6, user_id: 5)
