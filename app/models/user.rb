class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, :email, :password, presence: true

  validates :name,
    length: { maximum: 50 }

  validates :email,
    uniqueness: { case_sensitive: false },
    length: { maximum: 250 },
    format: { with: VALID_EMAIL_REGEX }

  validates :password, length: { minimum: 8 }

  has_secure_password

  def self.by_letter(letter)
    where('name LIKE ?', "#{letter}%").order(:name)
  end
end
