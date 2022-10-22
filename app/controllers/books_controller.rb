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
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:alret] = "投稿に失敗しました"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @updateBook = Book.new
  end

  def update
    # 指定のidページ
    @book = Book.find(params[:id])

    # 更新する投稿データの取得
    @updateBook = Book.new(book_params)

    # 正常に処理されるとフラッシュメッセージ
    if @updateBook.save
      flash[:notice] = "Book was successfully created."
      @updateBook.update(book_params)
      redirect_to book_path(@book.id)

    #異常が起きるとeditを再描写
    else
      render action: :edit
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
