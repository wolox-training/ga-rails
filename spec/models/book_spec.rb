require 'rails_helper'

RSpec.describe Book do
  invalid_params = %i[genre author image title publisher year]

  invalid_params.each do |key, val|
    context "should need only #{key}?" do
      subject(:book) { build(:book, key => val) }
      it 'require more params' do
        expect(book.save).to eq(false)
      end
    end
  end
  context 'with all parameters' do
    subject(:book) { build(:book) }
    it 'is successfully created' do
      expect(book.save).to eq(true)
    end
  end
end
