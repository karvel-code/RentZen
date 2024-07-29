# == Schema Information
#
# Table name: admin_user_profiles
#
#  id            :bigint           not null, primary key
#  first_name    :string           not null
#  phone         :string           not null
#  surname       :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :bigint           not null
#
# Indexes
#
#  index_admin_user_profiles_on_admin_user_id  (admin_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (admin_user_id => admin_users.id)
#
class AdminUserProfile < ApplicationRecord
end
