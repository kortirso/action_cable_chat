class CreateRoommates < ActiveRecord::Migration[5.0]
    def change
        create_table :roommates do |t|
            t.integer :room_id, null: false
            t.integer :user_id
            t.timestamps
        end
        add_index :roommates, [:room_id, :user_id]
    end
end
