module ApplicationHelper
  def get_current_event
    @current_event = Event.last
  end

  def is_admin
    return false if session[:user].nil? 
    session[:user].role == 'admin'
  end

  def getCategories
   client = Mysql2::Client.new(:host => "localhost", :database => "qwerty", :username => "root", :password => "tim") 
   results = client.query("SELECT * FROM b_iblock_section") 
  end

  def getProducts(categoryId)
   client = Mysql2::Client.new(:host => "localhost", :database => "qwerty", :username => "root", :password => "tim") 
   results = client.query("SELECT * FROM b_iblock_element WHERE iblock_section_id = " + categoryId) 
  end

  def getProduct(productId)
    client = Mysql2::Client.new(:host => "localhost", :database => "qwerty", :username => "root", :password => "tim") 
    results = client.query("SELECT * FROM b_iblock_element WHERE id = " + productId)  
  end

  def getCategoryName(categoryId)
    client = Mysql2::Client.new(:host => "localhost", :database => "qwerty", :username => "root", :password => "tim") 
    results = client.query("SELECT `name` FROM b_iblock_section WHERE id = " + categoryId)
  end
end
