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
      redirect_to show_path(@book.id)
    else
      render :root
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to :index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    # createの時はインスタンス変数格納時にストロングパラメータを使用したが、今回は更新時に更新するデータを絞り込む
    book.update(book_params)
    redirect_to show_path(book.id)
  end


   # privateで定義するとURLとアクションが紐づかなくなる(privateメソッドの命名は「モデル名_params」とすることが多い)
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  # # :ic


end
