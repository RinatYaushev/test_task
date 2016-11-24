require 'rails_helper'

RSpec.describe Slide, type: :model do
  it { should belong_to(:slider) }

  it { should have_attached_file :image }

  it do
    should validate_attachment_content_type(:image).
      allowing('image/png', 'image/jpeg', 'image/jpg', 'image/gif').
      rejecting('application/pdf')
  end

  it { should validate_presence_of :image }
end
