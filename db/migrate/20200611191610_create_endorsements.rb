class CreateEndorsements < ActiveRecord::Migration[6.0]
  def change
    create_table :endorsements do |t|
      t.integer :affiliate_id
      t.string :name
      t.string :caption
      t.boolean :enabled
      t.string :media_uri
      t.string :media_type

      t.timestamps
    end
  end
end
