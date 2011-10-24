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
 prod_array = Array.new
 index = 0
  @@client.query("SELECT * FROM b_iblock_section_element WHERE iblock_section_id = " + categoryId.to_s).each() do |row|
    @@client.query("SELECT * FROM b_iblock_element WHERE id = " + row["IBLOCK_ELEMENT_ID"].to_s+ " AND active = 'Y'").each() do |element|
      prod_array[index] = element
      index = index + 1
    end
  end
    return prod_array
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

        if !property["VALUE_ENUM"].nil?
          @@client.query("SELECT * FROM b_iblock_property_enum WHERE id = " + property["VALUE_ENUM"].to_s).each() do |prop_enum|
            property["VALUE"] = prop_enum["VALUE"]
          end
        end
        
        prop_name = getPropertyName(property["IBLOCK_PROPERTY_ID"])

        prop_name.each() do |name|
          property["NAME"] = name["NAME"]
          
          if name["USER_TYPE"] == 'Checkbox'
              property["VALUE"] = 'Есть' if property["VALUE"] == '1'
              property["VALUE"] = 'Нет' if property["VALUE"] == '0'            
          end
        end
      end
      return results
    end
    
  end 

  def getPropertyName(propertyId)
    results = @@client.query("SELECT * FROM b_iblock_property WHERE id = " + propertyId.to_s)
  end


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

def resizeImg(initial_image)
  initial_image.each() do |image|
    image_name = image["FILE_NAME"]
    image_path = "http://qwerty.kg/upload/" + image["SUBDIR"] + "/"
    image_source = (image_path + image_name) 
    img =  Magick::Image.read(image_source).first
    image_unic_name = image["SUBDIR"].sub("/","_") + image_name
    filepath = Rails.root.join('public', 'uploads', image_unic_name)
    file_source = "/uploads/" + image_unic_name
    if !FileTest.exists?("#{filepath}")
      img.change_geometry('225x300'){|cols, rows, newimg|
      newimg.resize!(cols, rows)
      newimg.write(filepath)
    }
    end 
    return file_source
  end 
end
