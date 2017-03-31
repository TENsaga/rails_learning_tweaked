class User < ApplicationRecord
  validates :name, :email, presence: true

  def self.by_letter(letter)
    where('name LIKE ?', "#{letter}%").order(:name)
  end
end
