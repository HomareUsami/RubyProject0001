class GreetingsController < ApplicationController
  before_action :set_greeting, only: %i[ show edit update destroy ]

  # GET /greetings or /greetings.json
  def index
    # indexページ時に@greetingsのみならず、@search_greetingsを用意して検索結果はそちらに入れるようにしておく。
    # こうすることで全体として何件のデータがあるのかというのは把握しやすくなり全体としての件数は何件という情報を表示しやすくなる。全体の件数表示などが不要であればこの変数を分ける必要はなくなる。
    @greetings = Greeting.all
    @search_greetings = @greetings
    # 検索が入った場合はindex時はsearchを行うようにして@greetingsを絞り込む
    if params[:search].present?
      @search_greetings = @search_greetings.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  # GET /greetings/1 or /greetings/1.json
  def show
  end

  # GET /greetings/new
  def new
    @greeting = Greeting.new
  end

  # GET /greetings/1/edit
  def edit
  end

  # POST /greetings or /greetings.json
  def create
    @greeting = Greeting.new(greeting_params)

    respond_to do |format|
      if @greeting.save
        format.html { redirect_to @greeting, notice: "Greeting was successfully created." }
        format.json { render :show, status: :created, location: @greeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @greeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greetings/1 or /greetings/1.json
  def update
    respond_to do |format|
      if @greeting.update(greeting_params)
        format.html { redirect_to @greeting, notice: "Greeting was successfully updated." }
        format.json { render :show, status: :ok, location: @greeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @greeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greetings/1 or /greetings/1.json
  def destroy
    @greeting.destroy!

    respond_to do |format|
      format.html { redirect_to greetings_path, status: :see_other, notice: "Greeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greeting
      @greeting = Greeting.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def greeting_params
      params.expect(greeting: [ :name, :message ])
    end
end
