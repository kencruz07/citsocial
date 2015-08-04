class Post < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  scope :latest, -> { order( :created_at => :desc ) }

  def self.timeline following_ids, id
    Post.where 'user_id IN (?) OR user_id = ?',
      following_ids, id
  end

end
