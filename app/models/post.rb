class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :followers,  class_name: 'User', through: :follows
  has_many :follows,    dependent: :destroy

  def has_follower?(user)
    follows.where(user: user).exists?
  end
end
