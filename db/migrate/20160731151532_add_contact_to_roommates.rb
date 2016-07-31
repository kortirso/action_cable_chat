class AddContactToRoommates < ActiveRecord::Migration[5.0]
    def change
        add_column :roommates, :contact_id, :integer
        add_index :roommates, :contact_id
    end
end
