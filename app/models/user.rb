require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_confirmation_of :password_confirmation
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :posts, :dependent => :destroy
  has_many :active_relationships, :class_name => 'Relationship',
                                  :foreign_key => 'follower_id',
                                  :dependent =>   :destroy
  has_many :passive_relationships, :class_name => 'Relationship',
                                   :foreign_key => 'followed_id',
                                   :dependent =>  :destroy
  has_many :following, :through => :active_relationships, :source => :followed
  has_many :followers, :through => :passive_relationships

  scope :alphabetical, -> { order( :last_name => :asc ) }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate email, password
    user = find_by_email email
    if user && user.password_hash ==
        BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def follow other_user_id
    self.active_relationships.create :followed_id => other_user_id
  end

  def unfollow other_user_id
    self.active_relationships.find_by(:followed_id => other_user_id).destroy
  end

  def following? other_user
    self.following.include? other_user
  end

  def timeline
    Post.timeline following_ids, id
  end
end
