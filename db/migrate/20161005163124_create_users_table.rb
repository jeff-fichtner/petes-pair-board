class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :type
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :phase
    end
  end
end
