class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :brief
      t.string :content
      t.string :image
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
