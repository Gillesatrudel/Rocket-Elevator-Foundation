class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_one :employee
 # has_one :customer
  def name
  "#{self.first_name} #{self.last_name}"
  end

end
