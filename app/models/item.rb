class Item < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true

end
