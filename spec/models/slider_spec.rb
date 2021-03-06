require 'rails_helper'

RSpec.describe Slider, type: :model do
  it { should have_many(:slides).dependent(:destroy) }

  it { should have_many(:posts).dependent(:destroy) }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }
end
