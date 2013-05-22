# 2.times do User.create( :email => Faker::Internet.email,
#                         :username => Faker::Name.first_name, 
#                         :password => "password")
# end

# 10.times do Post.create(:user_id => (1..2).to_a.sample, :url => Faker::Internet.url, :title => Faker::Lorem.sentence)
# end

30.times do Comment.create( :content => Faker::Lorem.sentence,
                            :user_id => (1..2).to_a.sample,
                            :post_id => (1..10).to_a.sample )
end
