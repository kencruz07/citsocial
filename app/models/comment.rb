class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  has_one :attachment, :as => :attachable, :dependent => :destroy

  accepts_nested_attributes_for :attachment


  validates_presence_of :content


  scope :latest, -> { order( :created_at => :desc ) }

end
