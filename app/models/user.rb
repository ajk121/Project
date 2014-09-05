class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation 
  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_many :comments

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
  
end
