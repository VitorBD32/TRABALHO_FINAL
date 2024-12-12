class CreateReservas < ActiveRecord::Migration[7.1]
  def change
    create_table :reservas do |t|
      t.date :data_entrada
      t.date :data_saida
      t.decimal :valor_total
      t.string :status

      t.timestamps
    end
  end
end
