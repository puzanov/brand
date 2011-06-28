class Article < ActiveRecord::Base
  validates_presence_of :title,   :message => "Нужно обязательно указать заголовок"
  validates_length_of   :brief,   :minimum => 6, :message => "Не указано описание или оно сликом короткое"
  validates_length_of   :content, :minimum => 6, :message => "Не указан полный текст или он слишком короткий"
  validates_presence_of :type
end
