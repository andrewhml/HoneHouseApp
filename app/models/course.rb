class Course < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :sport, presence: true
end
