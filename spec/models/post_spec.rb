require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:slider) }

  it { should validate_presence_of :name }

  it { should validate_presence_of :author }

  it { should validate_presence_of :content }

  it { should validate_presence_of :slider }
end
