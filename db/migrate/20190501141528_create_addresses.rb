class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :neighborhood

      t.timestamps
    end
  end
end
