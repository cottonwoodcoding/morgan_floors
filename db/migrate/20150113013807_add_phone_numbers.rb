class AddPhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
