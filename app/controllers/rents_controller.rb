class RentsController < ApplicationController
  def create
    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :not_acceptable
    end
  end

  def index
    render_paginated Rent.where(user_id: user_id),
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
