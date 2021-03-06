class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "first_name", :limit=>30
      t.string "last_name",:limit=>30
      t.string "email"
      t.string "username"
      t.string "password_digest"
      t.timestamps
    end
  end
end
