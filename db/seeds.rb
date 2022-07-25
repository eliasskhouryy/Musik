User.destroy_all
u1 = User.create :name => 'Elitas', :email => 'elitas@gmail.com', :password => 'cactus123', :admin => true
u2 = User.create :name => 'Martin Garrix', :email => 'martingarrix@gmail.com', :password => 'cactus123', :admin => false
u3 = User.create :name => 'Brooks', :email => 'brooks@gmail.com', :password => 'cactus123', :admin => false

Song.destroy_all
s1 = Song.create :title => 'Chasing Starts', :bpm => 140
s2 = Song.create :title => 'Someday', :bpm => 126
s3 = Song.create :title => 'Aurora', :bpm => 128

Genre.destroy_all
g1 = Genre.create :name => 'EDM'
g2 = Genre.create :name => 'Future House'
g3 = Genre.create :name => 'Progressive House'

Feed.destroy_all
f1 = Feed.create :comment => 'This was such an inspiration to make'
f2 = Feed.create :comment => 'Was inspired by a trip spend in the Arctic'

# Associations >>>>>>>>>>>>>>>

puts "Users and Songs"
u1.songs << s1
u2.songs << s3
u3.songs << s2

puts "Songs and genres"
s1.genres << g1
s2.genres << g1 << g2
s3.genres << g2 << g3

puts "feeds and everything other"
u1.feeds << f2
s1.feeds << f2
u2.feeds << f1
s3.feeds << f1