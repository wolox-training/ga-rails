class RentsController < ApplicationController
  def create
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer, status: :created
    else
      render json: rent.errors, status: :bad_request
=======
    rent_in { DateTime.now.to_date }
    rent_out { Faker::Date.forward(days: 60) }
=======
    # rent_in { DateTime.now.to_date }
    # rent_out { Faker::Date.forward(days: 60) }
>>>>>>> 65452d5... Create test POST #create for rents

    # DateTime.now.to_date = :rent_in
    # DateTime.now.to_date + 10.days = :rent_out

=======
>>>>>>> 3b6b8a2... Crete test #index for rents
    rent_now = DateTime.now.to_date
    rent_finish = rent_now + 10.days

    rent_params = { user_id: params[:user], book_id: params[:book],
                    rent_in: rent_now, rent_out: rent_finish }

    rent = Rent.new(rent_params)

    if rent.save
      render json: rent, serializer: RentSerializer
    else
      render plain: 'Error to create rent', status: :unprocessable_entity
>>>>>>> 76f7f49... Prototype rents routes.
    end
  end

  def index
<<<<<<< HEAD
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
=======
    if render_paginated json: Rent.find_by(user_id: params[:user_id]),
                        each_serializer: RentSerializer
    else
      render plain: 'No rents for this user ID', status: :unprocessable_entity
    end
>>>>>>> 3b6b8a2... Crete test #index for rents
  end

  private

  def user_id
    params.require(:id)
  end
>>>>>>> 76f7f49... Prototype rents routes.
end
