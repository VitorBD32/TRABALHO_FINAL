class AdicionarFoto < ActiveRecord::Migration[7.1]
  def change
   add_column :quartos, :foto,:string
  end
end
