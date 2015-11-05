class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :gender
      t.string :role
      t.integer :rollno_empid
      t.integer :phone_no
      t.timestamps
    end
  end
end
