class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :attachments, :as => :image

  scope :latest, -> { order( :created_at => :desc ) }

  has_attached_file :attachment,
    :styles => { :small => '64x64', :med => '100x100', :large => '200x200' }
  validates_attachment :attachment,
    :content_type => { :content_type => ['image/jpeg', 'image/gif', 'image/png'] }
end
