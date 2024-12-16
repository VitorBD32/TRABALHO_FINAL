class Reserva < ApplicationRecord
  belongs_to :user
  belongs_to :quarto

  validates :quarto_id, presence: true
  validates :user_id, presence: true
  validates :data_entrada, presence: true
  validates :data_saida, presence: true
  validates :valor_total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true


  after_create :atualizar

  validate :validar_periodo
  private

  def validar_periodo
    if data_entrada.present? && data_saida.present? && data_entrada > data_saida
      errors.add(:data_entrada, "não pode ser posterior à data de saída")
    end
  end


  private

  def atualizar
    quarto.update!(status: "Ocupado")
  end

  validate :verificar_disponibilidade_quarto

  private

  def verificar_disponibilidade_quarto
    conflito = Reserva.where(quarto_id: quarto_id)
                      .where.not(id: id) 
                      .where("data_entrada < ? AND data_saida > ?", data_saida, data_entrada)

    if conflito.exists?
      errors.add(:quarto_id, "já está reservado para o período selecionado")
    end
  end



end
# rails g migration AddUserToReserva