class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  end

  def index
    render json: Book.all, each_serializer: BookSerializer
  end
end
