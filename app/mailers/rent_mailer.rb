class RentMailer < ApplicationMailer
  default from: 'notifications@wolox.com.ar'

  def send_create_rent
    @rent = Rent.find(params[:rent_id])
    @book = @rent.book
    user = @rent.user

    setting_locale(user)
    mail(to: user.email, subject: "#{@book.title} " + I18n.t(:rented) + '!')
  end

  private

  def setting_locale(user)
    I18n.locale = user.locale.to_sym
  end
end
