class Flick < ActiveRecord::Base
  validates :name, presence: true
  validates :year, presence: true
end