class Post < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_and_belongs_to_many :likes, :class_name => 'User',
                                   :foreign_key => 'post_id',
                                   :dependent =>  :destroy

  scope :latest, -> { order( :created_at => :desc ) }

  def self.timeline following_ids, id
    Post.where 'user_id IN (?) OR user_id = ?',
      following_ids, id
  end

  def likers
    like_number = self.likes.count
    "#{like_number} #{'like'.pluralize like_number}"
  end

  def commenters
    comment_number = self.comments.count
    "#{comment_number} #{'comment'.pluralize comment_number}"
  end

end
