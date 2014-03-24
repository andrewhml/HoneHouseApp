class Unit < ActiveRecord::Base
  belongs_to :course
  validates :unit_number, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
