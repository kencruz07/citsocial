MAX_SEEDS = 5

Post.find_each do |post|
  User.find_each do |user|
    number_of_days = 5

    MAX_SEEDS.times do |comment_number|
      Comment.create :content => "Seed Comment #{comment_number + 1}",
        :user_id => user.id,
        :post_id => post.id,
        :created_at => number_of_days.days.ago,
        :updated_at => number_of_days.days.ago
      number_of_days -= 1
    end
  end
end
