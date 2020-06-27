class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_column :users, :failed_attempts, :integer
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
    add_column :users, :provider, :string
    add_column :users, :uid,:string

    add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true

    User.update_all confirmed_at: DateTime.now
    
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    remove_columns :users, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    remove_columns :users, :failed_attempts, :unlock_token, :unlocked_at
    remove_columns :users, :provider, :uid
  end
end
