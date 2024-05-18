class User < ApplicationRecord
  after_initialize :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_ROLE = "user"
  ADMIN_ROLE = "admin"
  enum role: { user: USER_ROLE, admin: ADMIN_ROLE }

  def set_default_role
    self.role = USER_ROLE
  end
end
