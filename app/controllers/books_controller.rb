class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(list_params)
    if @book.save
      redirect_to index_path(@list.id)
    else
      render :new
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
