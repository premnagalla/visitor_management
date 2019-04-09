class Locker < ApplicationRecord
  has_one :tenant_locker

  scope :available, -> { where(status: true) }
end
