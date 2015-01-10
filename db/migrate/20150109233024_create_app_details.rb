class CreateAppDetails < ActiveRecord::Migration
  def change
    create_table :app_details do |t|
      t.text :about
      t.string :phone
      t.string :street
      t.string :city
      t.string :province
      t.string :postal
      t.string :email

      t.timestamps
    end
  end
end
