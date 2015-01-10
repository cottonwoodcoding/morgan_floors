class CreateResourceLinks < ActiveRecord::Migration
  def change
    create_table :resource_links do |t|
      t.string :url
      t.text :description
      t.integer :priority

      t.timestamps
    end
  end
end
