class AddCommonPriceColumnToCommonPrice < ActiveRecord::Migration
  def self.up
    add_column :common_prices, :common_price_file_name,    :string
    add_column :common_prices, :common_price_content_type, :string
    add_column :common_prices, :common_price_file_size,    :integer
    add_column :common_prices, :common_price_updated_at,   :datetime 
  end

  def self.down
    remove_column :common_prices, :common_prices_file_name
    remove_column :common_prices, :common_prices_content_type
    remove_column :common_prices, :common_prices_file_size
    remove_column :common_prices, :common_prices_updated_at
  end
end
