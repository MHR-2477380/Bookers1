class BooksController < ApplicationController

  def index
  	@book = Book.new
    # 記事を全件取得
    @books = Book.all.order(id: "asc")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  	# ストロングパラメータ
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice:"Book was successfully created."
    else
      @books = Book.all.order(id: "asc")
      render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to book_path(book), notice:"Book was successfully updated."
    else render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
	params.require(:book).permit(:title, :body)
  end

end