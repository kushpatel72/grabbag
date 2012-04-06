class AddDatabaseAuthenticableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :database_authenticable, :boolean
    add_column :users, :confirmable, :boolean
  end
end
