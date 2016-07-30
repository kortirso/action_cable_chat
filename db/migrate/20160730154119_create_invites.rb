class CreateInvites < ActiveRecord::Migration[5.0]
    def change
        create_table :invites do |t|
            t.integer :user_id, null: false
            t.integer :friend_id, null: false
            t.timestamps
        end
        add_index :invites, :user_id
        add_index :invites, :friend_id
    end
end
