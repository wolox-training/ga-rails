# require 'i18n'
# I18n.locale = I18n.default_locale

class RentMailer < ApplicationMailer
  default from: 'notifications@wolox.com.ar'

  def send_create_rent
    # I18n.locale = I18n.default_locale
    # set_locale
    @rent = Rent.find(params[:rent_id])
    @book = @rent.book
    pepe = I18n.t(:book_details)
    mail(to: @rent.user.email, subject: "#{@book.title} rented!")

  end

  private

  def set_locale
    I18n.locale = :es
  end
end
