class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cases

  def self.member(user_id, my_cnic)
    logger.debug  my_cnic
    u = self.find(user_id)
    u.update(is_member: true, cnic: my_cnic)
    # u.update(cnic: my_cnic)      
  end
end
