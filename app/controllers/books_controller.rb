class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: Book.find(book_id), serializer: BookSerializer
  end

  def index
    render_paginated json: Book.all, each_serializer: BookSerializer
  end

  private

  def book_id
    params.require(:id)
  end
end
