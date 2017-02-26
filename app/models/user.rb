class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
              :trackable, :validatable
  has_many :followed_posts, class_name: 'Post', through: :follows
  has_many :follows
  has_many :posts

  # Don't let username be an email! (for ambiguity when logging in)
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
end
