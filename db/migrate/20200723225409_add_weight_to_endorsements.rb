class AddWeightToEndorsements < ActiveRecord::Migration[6.0]
  def change
    add_column :endorsements, :weight, :integer
    add_column :endorsements, :endorsement_type, :string
  end
end
