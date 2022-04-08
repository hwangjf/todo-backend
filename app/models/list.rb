class List < ApplicationRecord
  has_many :user_lists
  has_many :users, through: :user_lists

  has_many :items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def created_by
    users.order(:created_at).limit(1)
  end
end
