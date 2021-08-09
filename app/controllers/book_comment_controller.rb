class BookCommentController < ApplicationController
  
  def create
    @bookfind = Book.find(params[:book_id])
    comment = current_user.book_comment.new(book_comment_params)
    comment.book_id = @bookfind.id
    comment.save

  end
  
  def destroy
    @bookfind = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy

  end
  
  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
