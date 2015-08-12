class Attachment < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true

  has_attached_file :image,
    :styles => { :small => '100x100', :med => '200x200', :large => '300x300' }


  validates_attachment :image,
    :content_type => { :content_type => ['image/jpeg', 'image/gif', 'image/png'] }

end
