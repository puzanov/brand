class ArticlesController < ApplicationController
  before_filter :only_for_admin , :except => [:index, :show, :upload_img]
  protect_from_forgery :except => :upload_img

  def upload_img
    uploaded_io = params[:nicImage]
    current_ts = Time.now.to_i.to_s
    filepath = Rails.root.join('public', 'uploads', current_ts + uploaded_io.original_filename);
    File.open(filepath, 'w') do |file|
      file.write(uploaded_io.read)
    end
    image = Magick::Image.read(filepath).first
    status = Hash.new
    status["done"] = 1
    status["width"] = image.columns
    status["url"] = "/uploads/" + current_ts + uploaded_io.original_filename
    json_status = status.to_json
    render :text => "<script>try{top.nicUploadButton.statusCb(#{json_status})}catch(e){alert(e.message);}</script>"
  end
  
  # GET /articles
  # GET /articles.xml
  def index
    if !params[:article_type].nil?
      @articles = Article.order("id desc").find_all_by_article_type(params[:article_type])
    elsif        
      @articles = Article.order("id desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @page_title = @article.title
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @page_title = @article.title
  end

  # POST /articles
  # POST /articles.xml
  def create
    upload_file_if_needed params
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Новость успешно создана') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    upload_file_if_needed params
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  def upload_file_if_needed params
    if params[:article][:image].blank?
      return
    end  
    uploaded_io = params[:article][:image]
    current_ts = Time.now.to_i.to_s
    filepath = Rails.root.join('public', 'uploads', current_ts + uploaded_io.original_filename);
    File.open(filepath, 'w') do |file|
      file.write(uploaded_io.read)
    end
    
    image = Magick::Image.read(filepath).first
    image.change_geometry!("150") { |cols, rows, img|
      newimg = img.resize(cols, rows)
      newimg.write(filepath)
    }
    params[:article][:image] = current_ts + uploaded_io.original_filename
  end
end
