class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates :body, presence: true
end
