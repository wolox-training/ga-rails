class ExpiredRentNotificationWorker
  include Sidekiq::Worker

  def perform
    expired_rents = Rent.where(rent_out: Date.current)
    expired_rents.each do |rent|
      RentMailer.with(expired_rent: rent).expired_rent.deliver_later
    end
  end
end
