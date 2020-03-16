class BooksController < ApplicationController
# @をつけないとviewに渡せないので注意！
def top
end
def new
 # viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する
 @book = Book.new
end

def create
  @books = Book.all
  @book = Book.new(book_params)
  if @book.save
    redirect_to book_path(@book.id),notice:"Book was successfully created."
  else
    render :index
  end
end

def index
  @book = Book.new
  @books = Book.all
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

    redirect_to book_path(@book.id),notice:"Book was successfully updated."

  else
    render action: :edit
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end


private

def book_params
 params.require(:book).permit(:title,:body)
end
end
