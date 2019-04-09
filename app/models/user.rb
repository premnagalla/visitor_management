class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = ['admin', 'resident', 'security', 'visitor']
  after_initialize :set_default_role, :if => :new_record?

  scope :residents, -> { where(role: 'admin') }
  scope :securities, -> { where(role: 'security') }
  scope :visitors, -> { where(role: 'visitor') }

  def set_default_role
    self.role ||= 'visitor'
  end

  def full_name
    self.first_name + self.last_name if self.first_name
  end

  User::ROLES.each do|rol|
    define_method "#{rol}?" do
      role == rol
    end
  end
end
