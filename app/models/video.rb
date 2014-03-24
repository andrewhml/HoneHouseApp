class Video < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :lesson
end
