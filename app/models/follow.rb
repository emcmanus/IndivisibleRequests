class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
end
