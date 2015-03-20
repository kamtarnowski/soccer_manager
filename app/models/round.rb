class Round < ActiveRecord::Base
  has_many :matches
  default_scope -> { order('created_at ASC') }
end
