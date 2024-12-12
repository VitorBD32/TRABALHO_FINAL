class CreateQuartos < ActiveRecord::Migration[7.1]
  def change
    create_table :quartos do |t|
      t.string :numero
      t.string :tipo
      t.decimal :preco
      t.string :status

      t.timestamps
    end
  end
end
