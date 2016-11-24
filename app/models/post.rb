class Post < ActiveRecord::Base
  belongs_to :slider

  validates :name, :author, :content, presence: true
end
