class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, case_sensitive: false
  validates :password, presence: true, length: { minimum: 3}
  validates :password_confirmation, presence: true, length: { minimum: 3}

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase.strip
    user = User.find_by_email(new_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
