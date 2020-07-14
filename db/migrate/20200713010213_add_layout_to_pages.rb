class AddLayoutToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :layout, :string
  end
end
