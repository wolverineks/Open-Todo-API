class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true  
  validates :permissions, inclusion: { in: %w(private viewable open), message: "%{permissions} is not a valid option." }
end
