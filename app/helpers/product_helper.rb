module ProductHelper
  @@config = YAML.load_file(Rails.root + "config/mysql.yml")
  @@client = Mysql2::Client.new(
    :host => @@config["host"],
    :database => @@config["dbname"],
    :username => @@config["user"],
    :password => @@config["pass"]
  )

#-----------Получаем список категорий

 def getCategories
  results = @@client.query("SELECT * FROM b_iblock_section WHERE active = 'Y' AND iblock_section_id != 'NULL'") 
 end

#-------------Получаем продукцию для категории

 def getProducts(categoryId)
  results = @@client.query("SELECT * FROM b_iblock_element WHERE iblock_section_id = " + categoryId + " AND active = 'Y'") 
 end

 def getCategory(categoryId)
  results = @@client.query("SELECT * FROM b_iblock_section WHERE id = " + categoryId) 
 end

 def getCategoryName(categoryId)
  results = @@client.query("SELECT `name` FROM b_iblock_section WHERE id = " + categoryId)
 end

#----------------Получаем продукт по его id

  def getProduct(productId)
   results = @@client.query("SELECT * FROM b_iblock_element WHERE id = " + productId)  
  end

 def getProductPrice(productId)
  results = @@client.query("SELECT * FROM b_catalog_price WHERE product_id = " + productId + " AND catalog_group_id = 1")
 end

  def getProperties(productId)
    @@client.query("SELECT * FROM b_iblock_element WHERE `code` = " + productId.to_s).each() do |row|
      results = @@client.query("SELECT * FROM b_iblock_element_property WHERE iblock_element_id = " + (row["ID"]).to_s)
      results.each() do |property|
        property["NAME"] = getPropertyName(property["IBLOCK_PROPERTY_ID"])
      end
      return results
    end
  end 

  def getPropertyName(propertyId)
    results = @@client.query("SELECT `name` FROM b_iblock_property WHERE id = " + propertyId.to_s)
    results.each() do |row|
      return row["name"]
    end
  end

#  def getProperties(cat_name)
#    @@client.query("SELECT id FROM b_iblock WHERE `name` = '" + cat_name + "'").each() do |row|
#      results =  @@client.query("SELECT * FROM b_iblock_property WHERE iblock_id = " + (row["id"]).to_s + " AND  active = 'Y' ORDER BY sort ASC")
#      return results
#    end
#  end

#  def getPropertyValue(product_id, property_id)
#    results =  @@client.query("SELECT * FROM b_iblock_element_prop_m4 WHERE iblock_property_id = " + property_id.to_s)
#  end

 def getImageLink(imgId)
   results = @@client.query("SELECT * FROM b_file WHERE id = " + imgId) 
 end

 def hasProduct? cat
  productExist = false
  products = getProducts(cat)
  productExist = true if products.size > 0
  return productExist
 end
end
