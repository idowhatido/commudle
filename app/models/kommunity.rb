class Kommunity < ApplicationRecord
  # extend FriendlyId
  # friendly_id :name, use: :slugged
  belongs_to :user
  has_many :data_forms


end