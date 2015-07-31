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

  MAX_SEEDS.times do |post_number|
    Post.create
        :content => "Details about Seed Post #{post_number + 1} goes here",
        :user_id => user.id,
        :created_at => number_of_days.days.ago,
        :updated_at => number_of_days.days.ago,
        :title => "Seed Post #{post_number + 1}"
    number_of_days -= 1
  end
end

