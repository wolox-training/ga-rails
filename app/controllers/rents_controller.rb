class RentsController < ApplicationController
  def create
<<<<<<< HEAD
    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :bad_request
=======
    rent_in { DateTime.now.to_date }
    rent_out { Faker::Date.forward(days: 60) }

    DateTime.now.to_date = :rent_in
    DateTime.now.to_date + 10.days = :rent_out

    rent = Rent.new(params[:user], params[:book], :rent_in, :rent_out)

    if rent.save
      render json: rent, serializer: RentSerializer
    else
      render plain: 'Error to create rent', status: :unprocessable_entity
>>>>>>> 76f7f49... Prototype rents routes.
    end
  end

  def index
<<<<<<< HEAD
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
=======
    render_paginated Rent.find(user_id), serializer: UserRentsSerializer
    # TODO: crear un test de prueba.
  end

  private

  def user_id
    params.require(:id)
  end
>>>>>>> 76f7f49... Prototype rents routes.
end
