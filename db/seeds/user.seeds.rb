MAX_SEEDS = 5
number_of_days = 5

MAX_SEEDS.times do |user_number|
  User.create :first_name => "Seed User #{user_number + 1}",
    :last_name => 'Citsocial',
    :email => "seed_user#{user_number + 1}@gmail.com",
    :password => '1234',
    :created_at => number_of_days.days.ago,
    :updated_at => number_of_days.days.ago
  number_of_days -= 1
end
