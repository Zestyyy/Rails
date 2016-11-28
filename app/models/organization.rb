class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user

  validates :name, presence: true, length: { minimum: 6}
  validates :description, presence: true, length: { minimum: 11 }
end
