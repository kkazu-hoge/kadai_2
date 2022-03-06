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
    @book = Book.new(list_params)
    if @book.save
      redirect_to index_path
    else
      render :root
    end
  end
  
  def show
  end

  def edit
  end


   # privateで定義するとURLとアクションが紐づかなくなる(privateメソッドの命名は「モデル名_params」とすることが多い)
  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
  # :ic


end
