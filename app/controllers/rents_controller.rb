class RentsController < ApplicationController
  def create
    rent_params = { user_id: params[:user], book_id: params[:book],
                    rent_in: params[:rent_in], rent_out: params[:rent_out] }

    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :not_acceptable
    end
  end

  def index
    render_paginated json: Rent.where(user_id: params[:user_id]),
                     each_serializer: RentSerializer
  end
end
