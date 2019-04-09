class TenantLocker < ApplicationRecord

  #attr_accessible :user_id, :locker_id, :start_date, :end_date
  # belongs_to :tenant, class_name: 'User', foreign_key: :user_id
  belongs_to :locker
  belongs_to :visit

end
