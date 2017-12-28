class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    new_book = params[:book]
    Book.create(title: new_book["title"], author: new_book["author"])
    redirect_to books_url
  end

  def destroy
    id = params[:id]
    book_to_delete = Book.find(id)
    book_to_delete.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
