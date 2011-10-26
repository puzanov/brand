class CommonPricesController < ApplicationController
  # GET /common_prices
  # GET /common_prices.xml
  def index
    @common_prices = CommonPrice.order("id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @common_prices }
    end
  end

  def uploadFile
    post = CommonPrice.save(params[:common_price])
    render :text => "file has been uploaded successfully"
  end

  # GET /common_prices/1
  # GET /common_prices/1.xml
  def show
    @common_price = CommonPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @common_price }
    end
  end

  # GET /common_prices/new
  # GET /common_prices/new.xml
  def new
    @common_price = CommonPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @common_price }
    end
  end

  # GET /common_prices/1/edit
  def edit
    @common_price = CommonPrice.find(params[:id])
  end

  # POST /common_prices
  # POST /common_prices.xml
  def create
    @common_price = CommonPrice.new(params[:common_price])

    respond_to do |format|
      if @common_price.save
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @common_price, :status => :created, :location => @common_price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @common_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /common_prices/1
  # PUT /common_prices/1.xml
  def update
    @common_price = CommonPrice.find(params[:id])

    respond_to do |format|
      if @common_price.update_attributes(params[:common_price])
        format.html { redirect_to(@common_price, :notice => 'Common price was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @common_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /common_prices/1
  # DELETE /common_prices/1.xml
  def destroy
    @common_price = CommonPrice.find(params[:id])
    @common_price.destroy

    respond_to do |format|
      format.html { redirect_to(common_prices_url) }
      format.xml  { head :ok }
    end
  end
end
