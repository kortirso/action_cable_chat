class CreateMessages < ActiveRecord::Migration[5.0]
    def change
        create_table :messages do |t|
            t.integer :room_id, null: false
            t.integer :user_id, null: false
            t.string :body
            t.timestamps
        end
        add_index :messages, :room_id
        add_index :messages, :user_id
    end
end
