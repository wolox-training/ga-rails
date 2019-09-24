class RentMailer < ApplicationMailer
  default from: 'notifications@wolox.com.ar'

  def send_create_rent
    @rent = Rent.find(params[:rent_id])
    @book = @rent.book
    user = @rent.user
    mail(to: user.email,
         subject: "#{@book.title} rented!",
         body: body_format)
  end

  private

  def body_format
    body_text = "RENT DETAILS:\n\n"
    body_text << "Title: #{@book.title}, genre: #{@book.genre}, Author: #{@book.author}\n"
    body_text << "Date of creation of the rent: #{@rent.rent_in}\n"
    body_text << "End of rental: #{@rent.rent_out}"
  end
end
