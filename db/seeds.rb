# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MAX_SEEDS = 5

User.find_each do |user|
  
  number_of_days = 5
  post_list = []

  MAX_SEEDS.times do |post_number|
    post_list.push({
      :post_content => "Details about Seed Post #{post_number + 1} goes here", 
      :post_user_id => user.id,
      :post_created_at => number_of_days.days.ago,
      :post_updated_at => number_of_days.days.ago,
      :post_title => "Seed Post #{post_number + 1}"
    })
    number_of_days -= 1
  end

  post_list.each do |post|
    Post.create :content => post[:post_content], :user_id => post[:post_user_id],
        :created_at => post[:post_created_at], :updated_at => post[:post_updated_at],
        :title => post[:post_title]
  end

end

