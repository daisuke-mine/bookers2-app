class FavoritesController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to book_path(book)
  end
  
  def destroy
    book = Book.find(params[:book_id])
    favorite = favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    redirect_to book_path(book)
  end
end
