class Visit < ApplicationRecord
  has_one :tenant_locker
  has_one :locker, through: :tenant_locker

  accepts_nested_attributes_for :tenant_locker, reject_if: proc { |attributes| attributes[:locker_id].blank? }

  validates :email, presence: true
  validates :contact_no, presence: true, numericality: true, length: { :minimum => 10, :maximum => 15 }
  validates :first_name, presence: true
end
