class User < ActiveRecord::Base
  has_many :comments
  has_many :memories

  validates :email, length: { maximum: 255 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end

  def registered?
    role == 'registered'
  end
end
