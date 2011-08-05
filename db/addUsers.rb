require 'rubygems'
require 'sqlite3'
require 'zip/zipfilesystem'
require 'roo' #to be able to manage with .xls you need to do: sudo gem install roo; sudo gem install rubyzip

def addUsersToDb(users_array)
  db = SQLite3::Database.new('development.sqlite3')
  users_array.each do |user|
  db.execute("insert into users(login,password,name,role,email,created_at) 
            values ('#{user["login"]}','#{user["password"]}','#{user["name"]}','#{user["role"]}','#{user["email"]}','#{user["created_at"]}');")
  end
end

def readFile
  file_name = "users.xls"
  if FileTest::exist?(file_name)
    fileText = IO.readlines(file_name)
    fileText.each do |line|
    print line
  end
  else
  print "there is no file #{file_name}"
  end
end

def readXLS
   first_usefull_row_num = 2 
   oo = Excel.new("users.xls")
   oo.default_sheet = oo.sheets.first
   users = Array.new
   first_usefull_row_num.upto(oo.last_row) do |line|    
      params = Hash.new
      params["role"]       = 'user'
      params["created_at"] = '2010-09-10'
      params["name"]       = oo.cell(line,'C')
      params["email"]      = oo.cell(line,'E')
      params["login"]      = oo.cell(line,'F')
      params["password"]   = oo.cell(line,'G')           
      params["password"] = params["password"].to_i if oo.celltype(line,'G') == :float
      users[line-first_usefull_row_num] = params       
   end 
   return users
end

users = readXLS
addUsersToDb(users)
