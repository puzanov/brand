class CreateCommonPrices < ActiveRecord::Migration
  def self.up
    create_table :common_prices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :common_prices
  end
end
