class AddFieldsToUSers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :role, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
