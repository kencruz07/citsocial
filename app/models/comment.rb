class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :latest, -> { order( :created_at => :desc ) }
end
