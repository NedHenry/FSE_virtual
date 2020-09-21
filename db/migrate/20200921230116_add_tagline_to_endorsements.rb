class AddTaglineToEndorsements < ActiveRecord::Migration[6.0]
  def change
    add_column :endorsements, :tagline, :string
    add_column :endorsements, :subtitle, :string
    change_column :endorsements, :caption, :text
  end
end
