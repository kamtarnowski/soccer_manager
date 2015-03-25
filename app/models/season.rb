class Season < ActiveRecord::Base
  validates :status, inclusion: { in: ['active', 'inactive'] }
end
