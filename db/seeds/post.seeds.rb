MAX_SEEDS = 5

User.find_each do |user|
  number_of_days = 5

  MAX_SEEDS.times do |post_number|
    Post.create :content => "Details about Seed Post #{post_number + 1}",
      :user_id => user.id,
      :created_at => number_of_days.days.ago,
      :updated_at => number_of_days.days.ago,
      :title => "Seed Post #{post_number + 1}"
    number_of_days -= 1
  end
end
