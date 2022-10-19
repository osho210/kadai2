class BooksController < ApplicationController
  def new
  end

  def index
    # dbに格納されているデータをすべて取得
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end

  def show
  end

  def edit
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
