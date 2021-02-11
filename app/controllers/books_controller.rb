class BooksController < ApplicationController
  def first
  end
  def index
    @books = Book.all
  end
  def new
    @book = Book.new(book_params)
  end
  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book)
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      @book2 = book
      render action: :index
    end
  end



  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params2)
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully updateed."
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end

  private
  def book_params
    params.permit(:title, :body)
  end
  def book_params2
    params.require(:book).permit(:title, :body)
  end

end
