require 'rails_helper'

RSpec.describe Rent do
  subject(:rent) { build(:rent) }
  it { is_expected.to be_valid }
end
