class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = @book_show.user
  end

  def edit
  end
  
   private
   
def book_params
    params.require(:book).permit(:title, :body) 
end
end
