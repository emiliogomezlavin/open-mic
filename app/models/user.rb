class User < ActiveRecord::Base
  has_many :visits
  has_many :venues, through: :visits
  
  validates :first_name, :last_name,:description, :email, :age, :current_city, :password, confirmation: true, presence: true
  validates :email_confirmation, :password_confirmation, presence: true

  has_secure_password
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
