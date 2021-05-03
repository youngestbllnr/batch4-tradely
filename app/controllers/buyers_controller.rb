class BuyersController < ApplicationController
  before_action :set_buyer, only: %i[show edit update destroy]
  before_action :unless_admin

  def index
    @buyers = User.all.where(role: 'buyer')
    @buyers = @buyers.order('id DESC')
    counts(@buyers)
    @buyers = @today if params[:period] == 'today'
    @buyers = @this_week if params[:period] == 'this_week'
    @buyers = @this_month if params[:period] == 'this_month'
  end

  # GET /buyers/new
  def new
    @buyer = User.new
  end

  # GET /buyers/1/edit
  def edit; end

  # GET /buyers/1
  def show
    @buyer = User.find(params[:id])
  end

  # POST /buyers or /buyers.json
  def create
    @buyer = User.new(buyer_params)

    respond_to do |format|
      if @buyer.save && @buyer.confirm
        format.html { redirect_to buyers_path(anchor: "buyer_#{@buyer.id}"), notice: 'Buyer was successfully created.' }
        format.json { render :show, status: :created, location: @buyer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyers/1 or /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to buyers_path(anchor: "buyer_#{@buyer.id}"), notice: 'Buyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1 or /buyers/1.json
  def destroy
    @buyer.destroy
    respond_to do |format|
      format.html { redirect_to buyers_path(anchor: "buyer_#{@buyer.id}"), notice: 'Buyer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_buyer
    @buyer = User.find(params[:id])
  end

  def buyer_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
