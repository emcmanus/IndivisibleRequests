class Follow < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :post, counter_cache: true
end
