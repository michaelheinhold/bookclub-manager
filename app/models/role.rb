class Role < ApplicationRecord
  belongs_to :clubs
  has_many :users
end
