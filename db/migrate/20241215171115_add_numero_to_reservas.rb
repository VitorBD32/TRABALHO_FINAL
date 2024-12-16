class AddNumeroToReservas < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservas, :quarto, null: true, foreign_key: true
  end
end
