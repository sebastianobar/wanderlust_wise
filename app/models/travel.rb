class Travel < ApplicationRecord
  attr_accessor :owner

  resourcify

  geocoded_by :destination_address

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  after_validation :geocode
  after_create :set_owning_role

  has_many :users, -> { distinct }, through: :roles, class_name: 'User', source: :users

  def set_owning_role
    owner&.add_role(:owner, self)
  end
end
