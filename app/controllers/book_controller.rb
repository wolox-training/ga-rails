class BookController < ApplicationController
  #before_action :authenticate_user!

  def show
    render json: Book, serializer: BookSerializer
  end

  def index
    render json: Book, each_serializer: BooksSerializer
  end
end
