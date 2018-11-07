class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @books_find = Book.find([1,3]) # = Book.find(1,3)도 같은 동작.  id에 해당하는 데이터 보여줌.
    @book_find_by = Book.find_by(publish: "멋사단국대 - '1'",price: 500) # 조건과 일치하는 데이터 최초 1개만 보여줌
    @books_where = Book.where(publish: "멋사단국대 - '2'") #조건과 일치하는 데이터 전부
    @books_where_not = Book.where.not(id: params[:id]) #조건과 일치하지 않는 데이터 전부
  end
  
  
  def order
    @books = Book.all.order(price: :desc).limit(3) #가격을 내림차순으로 정렬후 위에서 3개만 보여줌
    @books_select = Book.where('price >= 2000').select(:id, :name) #가격이 2000원 이상인 데이터의 id, name만 보여라
    @books_cnt = @books.count
  end
  

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :name, :price, :publish)
    end
end
