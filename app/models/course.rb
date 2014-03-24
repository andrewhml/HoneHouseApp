class Course < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :units
  has_many :reviews

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :sport, presence: true
end
