class Chef < ApplicationRecord
  belongs_to :user
  has_many :courses

  # include PgSearch::Model
  # multisearchable against: [:restaurant_name, :specialty]
end
