class RentMailer < ApplicationMailer
  default from: 'notifications@wolox.com.ar'

  def send_create_rent
    @rent = Rent.find(params[:rent_id])
    @book = @rent.book
    mail(to: @rent.user.email, subject: "#{@book.title} rented!")
  end
end
