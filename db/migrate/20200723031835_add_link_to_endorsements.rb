class AddLinkToEndorsements < ActiveRecord::Migration[6.0]
  def change
    add_column :endorsements, :link, :string
  end
end
