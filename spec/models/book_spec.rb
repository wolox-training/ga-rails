require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book) }
  params = nil

  context 'validate tests:' do
    it 'require params' do
      book = Book.new(params).save
      expect(book).to eq(false)
    end

    it 'should save successfully' do
      expect(subject.save).to eq(true)
    end
  end
end
