class RentsController < ApplicationController
  def create
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
    if render_paginated json: Rent.find_by(user_id: params[:user_id]),
                        each_serializer: RentSerializer
    else
      render plain: 'No rents for this user ID', status: :unprocessable_entity
    end
  end

  private

  def user_id
    params.require(:id)
  end
end
