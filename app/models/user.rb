class User < ActiveRecord::Base
  validates_presence_of :login,     :message => "Необходимо указать логин пользователя"
  validates_presence_of :password,  :message => "Необходимо указать пароль пользователя"
  validates_presence_of :name,      :message => "Необходимо указать имя пользователя"
  validates_presence_of :email,     :message => "Необходимо указать email пользователя"

  validates_uniqueness_of :login,   :message => "Такой логин уже существует"
end
