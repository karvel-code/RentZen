class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  scope :latest, ->{ order("created_at DESC") }
  scope :search_with, lambda { |q|
    where("name ILIKE ?", "%#{q}%")
  }
end
