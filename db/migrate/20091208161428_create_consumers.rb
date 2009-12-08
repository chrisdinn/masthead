class CreateConsumers < ActiveRecord::Migration
  def self.up
    create_table :consumers do |t|
      t.string :label
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :consumers
  end
end
