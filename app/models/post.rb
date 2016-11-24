class Post < ActiveRecord::Base
  belongs_to :slider

  validates :name, :author, :content, :slider, presence: true
end
