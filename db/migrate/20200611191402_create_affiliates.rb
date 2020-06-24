class CreateAffiliates < ActiveRecord::Migration[6.0]
  def change
    create_table :affiliates do |t|
      t.string :name
      t.integer :user_id
      t.string :type
      t.string :plan
      t.string :weight

      t.timestamps
    end
  end
end
