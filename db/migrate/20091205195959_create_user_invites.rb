class CreateUserInvites < ActiveRecord::Migration
  def self.up
    create_table :user_invites do |t|
      t.string :email
      t.string :invite_code, :limit => 40
      t.datetime :invited_at
      t.datetime :redeemed_at

      t.timestamps
    end
    add_index :user_invites, [:id, :email]
    add_index :user_invites, [:id, :invite_code]
  end

  def self.down
    drop_table :user_invites
  end
end
