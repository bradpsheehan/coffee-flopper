class ShopsController < ApplicationController

  def connect
    if session[:access_token]
      redirect_to root_path
    else
      redirect_to Instagram.authorize_url(:redirect_uri => oauth_callback_url)
    end
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => oauth_callback_url)
    session[:access_token] = response.access_token
    redirect_to root_path
  end

  def index
    @shops = Shop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.json
  def new
    @shop = Shop.new
    @shop.build_address

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(params[:shop])

    if @shop.save
      redirect_to @shop, notice: 'Shop was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /shops/1
  # PUT /shops/1.json
  def update
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end
end
