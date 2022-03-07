class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      # 一覧遷移時にbooksのインスタンス変数に一覧用データ取得必要
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
   # privateで定義するとURLとアクションが紐づかなくなる(privateメソッドの命名は「モデル名_params」とすることが多い)
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  # # :ic


end
