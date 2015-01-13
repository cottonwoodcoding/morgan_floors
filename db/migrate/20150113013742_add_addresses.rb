class AddAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :civic_address
      t.string :municipality
      t.string :postal_code

      t.timestamps
    end
  end
end
