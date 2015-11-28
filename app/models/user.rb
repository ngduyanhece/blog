class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  after_create :send_confirm_mail

  def send_confirm_mail
    Usermailer.send_new_user_message(self).deliver
  end
  def to_s 
  	"#{fname} #{lname}"
  end
end
