class CreateStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.date :date
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.integer :volume

      t.timestamps
      t.index [ :ticker, :date ], unique: true
      t.index :ticker
      t.index :date
    end
  end
end
