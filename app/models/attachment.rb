# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  attachable_id      :integer
#  attachable_type    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Attachment < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true

  has_attached_file :image,
    :styles => {:small => '100x100', :med => '200x200', :large => '300x300'}


  validates_attachment :image,
    :content_type => {:content_type => ['image/jpeg', 'image/gif', 'image/png']}

end
