class BooksController < ApplicationController

  def show
   
    @bookfind = Book.find(params[:id])
    @book = Book.new
    @user =  @bookfind.user
    @book_new_comment = BookComment.new

  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    # @books = Book.all
    @books = Book.includes(:user).sort {|a,b| b.favorites.where("created_at > ?", 7.day.ago).size <=> a.favorites.where("created_at > ?", 7.day.ago).size}
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render 'index'
    end
  end

  def edit
     @book = Book.find(params[:id])
    # @user = current_user
    if @book.user.id != current_user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
