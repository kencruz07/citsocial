# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  has_one :attachment, :as => :attachable, :dependent => :destroy

  accepts_nested_attributes_for :attachment


  validates_presence_of :content


  scope :latest, -> { order :created_at => :desc }

end
