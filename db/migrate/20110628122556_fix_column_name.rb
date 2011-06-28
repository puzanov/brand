class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :articles, :type, :article_type
  end

  def self.down
  end
end
