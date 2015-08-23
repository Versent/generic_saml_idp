class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :url, :string
    add_column :users, :company, :string
    add_column :users, :location, :string
  end
end
