class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :account, optional: true
  has_one :admin_user_profile

  class << self
    def set_user_account(account_id:)
      self.update(account_id: account_id)
    end
  end
end
