class Slide < ActiveRecord::Base
  belongs_to :slider

  has_attached_file :image, styles: { thumb: '296x200#', cover: '296x380#' }, default_style: :original

  validates_attachment :image,
    content_type: { content_type: /^image\/(jpeg|jpg|png|gif)$/ },
    size: { in: 0..5.megabytes }

  validates :image, presence: true
end
