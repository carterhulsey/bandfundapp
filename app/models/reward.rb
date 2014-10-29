class Reward < ActiveRecord::Base
  validates :price, :title, :description, presence: true
  belongs_to :artist
end
