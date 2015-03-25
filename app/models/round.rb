class Round < ActiveRecord::Base
  has_many :matches
  validates :status, inclusion: { in: ['closed', 'open', 'inaccessible'] }
  default_scope { order('created_at ASC') }

  scope :active_rounds, -> { where(status: 'open' || 'inaccessible') }
end
