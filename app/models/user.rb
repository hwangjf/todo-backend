class User < ApplicationRecord
  has_many :user_lists
  has_many :lists, through: :user_lists
  has_many :items, through: :lists

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def to_json
    {
      id: id,
      username: username,
    }
  end
end
