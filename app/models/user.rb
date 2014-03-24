class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  VALID_STRINGS = %w( general admin )
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: VALID_STRINGS

  has_many :memberships
  has_many :courses, through: :memberships
  has_many :reviews

  # This method associates the attribute ":course_image" with a file attachment
  has_attached_file :profile_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '800x600>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/

  def is_admin?
    true if self.role == 'admin'
  end
end
