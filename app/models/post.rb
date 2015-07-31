class Post < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  scope :latest, -> { order( :created_at => :desc ) } 
end
