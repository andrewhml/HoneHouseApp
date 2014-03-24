class Unit < ActiveRecord::Base
  validates :unit_number, presence: true
  validates :title, presence: true

  belongs_to :course
  has_many :lessons, order: :created_at
end
