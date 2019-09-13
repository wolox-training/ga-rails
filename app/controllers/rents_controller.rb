class RentsController < ApplicationController
  def create
    rent = Rent.new(rent_params)
    authorize rent

    if rent.save
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :bad_request
    end
  end

  def index
    rent = Rent.includes(:user, :book).where(user_id: user_id)
    authorize rent
    render_paginated rent,
                     each_serializer: RentSerializer
  end
end
private
def rent_params
  params.require(:rent).permit(:user_id, :book_id, :rent_in, :rent_out)
end

def user_id
  params.require(:user_id)
end
