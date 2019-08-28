require 'rails_helper'
RSpec.describe Book do
  subject(:book) { build(:book) }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to be_valid }
end
