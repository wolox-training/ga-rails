class RentsController < ApplicationController
  def create
    # rent_in { DateTime.now.to_date }
    # rent_out { Faker::Date.forward(days: 60) }

    # DateTime.now.to_date = :rent_in
    # DateTime.now.to_date + 10.days = :rent_out

    rent_now = DateTime.now.to_date
    rent_finish = rent_now + 10.days

    rent_params = { user_id: params[:user], book_id: params[:book],
                    rent_in: rent_now, rent_out: rent_finish }

    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer
    else
      render plain: 'Error to create rent', status: :unprocessable_entity
    end
  end

  def index
    render_paginated Rent.find(user_id), serializer: UserRentsSerializer
    # TODO: crear un test de prueba.
  end

  private

  def user_id
    params.require(:id)
  end
end
