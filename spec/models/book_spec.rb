require 'rails_helper'
# require 'active_record'
# require 'database_cleaner'
# require 'faker'

RSpec.describe Book, type: :model do
  # let(:params) do
  #   { genre: 'Horror', author: 'Ann Rice', image: 'asd.png',
  #     title: 'Vampire', publisher: 'Edit. Norma', year: '1996' }
  # end

  let(:params) do
    { genre: Faker::Name.name, author: Faker::TvShows::StarTrek.character, image:Faker::Name.name,
        title: Faker::Name.name, publisher: Faker::Name.name, year: Faker::Name.name}
  end

  context 'Validate gems config' do
    it 'Faker?' do
      ran_str = Faker::Name.name
      expect(ran_str).to be_a(String)
    end
    it 'Factory_bot?' do
      fac_bot = create(:book)
      expect(fac_bot).to be_a(Book)
    end
  end

  context 'Validate tests:' do
    it 'ensure title presence' do
      book = Book.new(title: 'vampire').save
      expect(book).to eq(false)
    end

    it 'should save successfully' do
      book = Book.new(params).save
      expect(book).to eq(true)
    end
  end

  context 'Scope test:' do
    before(:each) do
      @book1 = Book.new(params).save
      @book2 = Book.new(params).save
    end

    # it 'comparation users?' do
    #   expect(@book1.title).to eq("pepe")
    # end
  end
end
# context 'before' do
#   DatabaseCleaner.clean_with  :truncation
#  end
#
# context'around'  do |example|
#   DatabaseCleaner.cleaning do
#     example
# end

#   describe Book do
#     required_fields = %i[genre author image title editor year]
#
#     context 'with correctly typed required fields' do
#       subject { build(:book) }
#
#       it { is_expected.to be_valid }
#
#       required_fields.each do |field|
#         it { is_expected.to validate_presence_of(field) }
#       end
#
#       it 'should save correctly' do
#         expect(subject.save).to be true
#       end
#     end
#
#     required_fields.each do |field|
#       context "with missing #{field}" do
#         subject { build(:book, field => nil) }
#
#         it { is_expected.to_not be_valid }
#
#         it 'should not be save' do
#           expect(subject.save).to_not be true
#         end
#       end
#     end
#   end
