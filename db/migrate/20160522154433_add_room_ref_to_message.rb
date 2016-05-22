class AddRoomRefToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :room, foreign_key: true, index: true
  end
end
