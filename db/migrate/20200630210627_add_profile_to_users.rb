class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :display_name, :string
    add_column :users, :description, :text
    add_column :users, :pronouns, :string
    add_column :users, :fetlife, :string
    add_column :users, :visibility, :string
  end
end
