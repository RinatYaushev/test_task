class Slider < ActiveRecord::Base
  has_many :slides, dependent: :destroy

  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
