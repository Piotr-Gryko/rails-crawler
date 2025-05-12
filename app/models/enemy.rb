class Enemy < ApplicationRecord
  validates :x, :y, :name, :direction, presence: true
end
