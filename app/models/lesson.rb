class Lesson < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :unit
  has_one :video
end
