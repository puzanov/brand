class Event < ActiveRecord::Base
  validates_presence_of :title,   :message => "Нужно обязательно указать заголовок"
  validates_length_of   :content,   :minimum => 6, :message => "Не указано описание или оно сликом короткое"
end
