class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists

  validates :username, presence: true
  validates :password, presence: true
end
