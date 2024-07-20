class UnitPayment < ApplicationRecord
  belongs_to :unit
  belongs_to :unit_owner
  has_many :utility_payments

  enum status: {
    pending: 'pending',
    partially_paid: 'partially_paid',
    paid: 'paid',
    overdue: 'overdue'
  }
end
