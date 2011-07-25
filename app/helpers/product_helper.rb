module ProductHelper
 @@client = Mysql2::Client.new(:host => "localhost", :database => "qwerty", :username => "root", :password => "tim") 


 def getCategories
  results = @@client.query("SELECT * FROM b_iblock_section") 
 end

 def getProducts(categoryId)
  results = @@client.query("SELECT * FROM b_iblock_element WHERE iblock_section_id = " + categoryId) 
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

 def getImageLink(productId)
   results = @@client.query("SELECT * FROM b_file WHERE id = " + productId) 
 end

end
