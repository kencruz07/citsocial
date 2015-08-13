# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#

class Post < ActiveRecord::Base

  belongs_to :user

  has_one :attachment, :as => :attachable, :dependent => :destroy

  has_many :comments, :dependent => :destroy

  has_and_belongs_to_many :likes, :class_name => 'User',
                                   :foreign_key => 'post_id',
                                   :dependent =>  :destroy

  accepts_nested_attributes_for :attachment


  validates_presence_of :title


  scope :latest, -> { order :created_at => :desc }



  def self.timeline following_ids, id
    Post.where 'user_id IN (?) OR user_id = ?',
      following_ids, id
  end

end
