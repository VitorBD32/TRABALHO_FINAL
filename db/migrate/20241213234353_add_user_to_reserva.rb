class AddUserToReserva < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservas, :user, null: false, foreign_key: true
  end
end
