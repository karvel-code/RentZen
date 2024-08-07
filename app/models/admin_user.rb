# == Schema Information
#
# Table name: admin_users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint
#  invited_by_id          :bigint
#
# Indexes
#
#  index_admin_users_on_account_id            (account_id)
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_invitation_token      (invitation_token) UNIQUE
#  index_admin_users_on_invited_by            (invited_by_type,invited_by_id)
#  index_admin_users_on_invited_by_id         (invited_by_id)
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
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
