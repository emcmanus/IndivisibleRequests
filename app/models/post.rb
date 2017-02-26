class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :followers,  class_name: 'User', through: :follows
  has_many :follows,    dependent: :destroy

  default_scope { order('created_at DESC') }

  def has_follower?(user)
    follows.where(user: user).exists?
  end

  after_commit do
    follows.create(user: user)
  end
end
