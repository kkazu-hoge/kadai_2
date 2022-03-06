class BooksController < ApplicationController

  #View:index method:get 時のアクション
  def index
    #一覧データ取得するためのインスタンス変数
    @books = Book.all
    #新規投稿する際のデータを格納するインスタンス変数
    @book = Book.new
  end

  #View:index method:post 時(Create Bookボタン押下)のアクション
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfuly created'
      redirect_to book_path(@book.id)
    else
      # 一覧遷移時にbooksのインスタンス変数に一覧用データ取得必要
      @books = Book.all
      render :books
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to :books
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
      flash[:notice] = 'Book was successfuly created'
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
