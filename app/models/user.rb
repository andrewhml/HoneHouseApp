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

  def is_admin?
    true if self.role == 'admin'
  end
end
