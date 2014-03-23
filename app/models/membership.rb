class Membership < ActiveRecord::Base
  VALID_STRINGS = %w( student teacher )
  belongs_to :user
  belongs_to :course
  validates :role, inclusion: VALID_STRINGS
end
