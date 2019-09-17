class OpenLibraryBooksController < ApplicationController
  def book_information
    response = OpenLibraryBooks.new(params[:isbn]).retrieve_book_information

    if response[:error].present?
      render plain: response[:error], status: :not_found
    else
      render json: response
    end
  end
end
