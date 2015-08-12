class Comment < ActiveRecord::Base
  validates_presence_of :content

  belongs_to :user
  belongs_to :post
  has_one :attachment, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :attachment

  scope :latest, -> { order( :created_at => :desc ) }
end
