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

User.create(id:1, name: 'Marcelo', username: 'marcelomaidden@gmail.com')
User.create(id:2, name: 'Steven', username: 'steven@gmail.com')
User.create(id:3, name: 'Carlos', username: 'carlos@gmail.com')
User.create(id:4, name: 'Arturo', username: 'arturo@gmail.com')
User.create(id:5, name: 'Mir', username: 'mir@gmail.com')
User.create(id:6, name: 'Imran', username: 'imran@gmail.com')

Article.create(id:1, author_id:1, title: 'Maldives, the best island for honeymoon', 
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
  image: 'https://visitmaldives.s3.amazonaws.com/24YE1Yey/c/s5fdebdc-shareable_image.jpg')

ArticleCategory.create(article_id: 1, category_id: 1)
ArticleCategory.create(article_id:2, category_id: 2)
ArticleCategory.create(article_id:2, category_id: 3)

Vote.create(article_id: 1, user_id: 2)
Vote.create(article_id: 1, user_id: 3)
Vote.create(article_id: 1, user_id: 4)
Vote.create(article_id: 1, user_id: 5)
Vote.create(article_id: 1, user_id: 6)

Article.create(id:2, author_id:2, title: 'Male Island: Best Island In Maldives',
  text: 'Male is the best island in Maldives for honeymoon for all those luxury-seeker couples. 
  It is on this island that the major international airport of Maldives is located and you should
   ideally visit this island at the very beginning or the end of your honeymoon in Maldives. 
   Though it is often dismissed as a destination with little sightseeing options, 
   it must not be missed. For it is here that you experience the true
   Maldivian culture and it is the best island to stay in Maldives for honeymoon.',
   image: 'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2017/05/shutterstock-567919321-kw-220517-An-aerial-shot-of-the-Male-island-in-Maldives.jpg')

ArticleCategory.create(article_id:2, category_id: 1)
ArticleCategory.create(article_id:2, category_id: 2)

Vote.create(article_id: 2, user_id: 3)
Vote.create(article_id: 2, user_id: 4)
Vote.create(article_id: 2, user_id: 5)

Article.create(id:3, author_id: 3, title: 'Fihalhohi Island: Beauty And Romance',
  text: 'Situated in the Kaafu Atoll of South Mal-, is among the most beautiful places to visit in Maldives for the honeymooners. The Fihalhohi Island Resort here is, in fact, is one of the most romantic Maldives island resorts that has a number of overwater bungalows to stay in.

  Best experiences: In addition to its well-equipped overwater properties, 
  its Palm Groove, Aeolus Dive Centre, and Anggerik Spa make the Fihalhohi Island Resort a 
  splendid stay option. And the pristine beaches on the island that shaded by coconut palm trees 
  are truly romantic.',
  image: 'https://img.traveltriangle.com/blog/wp-content/uploads/2017/05/shutterstock-130167065-kw-220517-A-couple-on-a-jetty-in-front-of-the-overwater-properties-on-an-island-resort-in-Maldives.jpg'
)

ArticleCategory.create(article_id: 3, category_id: 1)
ArticleCategory.create(article_id: 3, category_id: 3)

Vote.create(article_id: 3, user_id: 5)

Article.create(id:4, author_id: 4, 
  title: 'A Honeymoon in Arunachal Pradesh',
text: 'You have met your soulmate, and the special day in both of your life is to arrive soon.
 The big fat wedding in your life brings with it lots of chaos and everything seems to spiral 
 out of proportion at the nick of the moment. Sometimes the wedding venue is not up to the mark 
 and somewhere else the perfect dress is still a mystery. Amidst all these confusions the last 
 thing that craves for your attention is the “Honeymoon”. After all, it is the only time away 
 from the mayhem in which both life partners get to spend time with each other. 
 There are various destinations suitable 
for a honeymoon in Arunachal Pradesh that makes this state best for a romantic escapade.',
image: 'https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/cover-Honeymoon-in-Arunachal-Pradesh_10th-jan.jpg')

ArticleCategory.create(article_id: 4, category_id: 2)
ArticleCategory.create(article_id: 4, category_id: 4)
ArticleCategory.create(article_id: 4, category_id: 5)

Vote.create(article_id: 4, user_id: 5)
Vote.create(article_id: 4, user_id: 3)