class BooksController < ApplicationController
  def new
    @books = Book.all.order(id: :asc)
    @book = Book.new(book_params)
  end

  def index
    # dbに格納されているデータをすべて取得
    @books = Book.all.order(id: :asc)
    # 最新の投稿のデータをインスタンス変数に格納
    @book = Book.new
  end

  def create
    @books = Book.all.order(id: :asc)
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @searchBook = Book.new
  end

  def update
    # 指定のidページ
    @book = Book.find(params[:id])
    @searchBook = Book.new

    if @searchBook.save
      @searchBook.update(book_params)
      redirect_to book_path(@searchBook.id)
    else
      render :edit
    end


  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
