module ProductHelper
  @@config = YAML.load_file(Rails.root + "config/mysql.yml")
  @@client = Mysql2::Client.new(
    :host => @@config["host"],
    :database => @@config["dbname"],
    :username => @@config["user"],
    :password => @@config["pass"]
  )

 def getCategories
  results = @@client.query("SELECT * FROM b_iblock_section WHERE active = 'Y' AND iblock_section_id != 'NULL'") 
 end

 def getProducts(categoryId)
  results = @@client.query("SELECT * FROM b_iblock_element WHERE iblock_section_id = " + categoryId + " AND active = 'Y'") 
 end

  def getProduct(productId)
   results = @@client.query("SELECT * FROM b_iblock_element WHERE id = " + productId)  
  end

  def getCategoryName(categoryId)
   results = @@client.query("SELECT `name` FROM b_iblock_section WHERE id = " + categoryId)
  end

  def getCategory(categoryId)
  results = @@client.query("SELECT * FROM b_iblock_section WHERE id = " + categoryId) 
  end

 def getImageLink(imgId)
   results = @@client.query("SELECT * FROM b_file WHERE id = " + imgId) 
 end
end
