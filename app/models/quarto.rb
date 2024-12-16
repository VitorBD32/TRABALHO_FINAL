class Quarto < ApplicationRecord
    mount_uploader :foto, FotoUploader
    has_many :reservas, dependent: :nullify

    validates :numero, presence: true, uniqueness: true
    validates :preco, presence: true,  numericality: { greater_than: 0 }
    validates :status, presence: true
    validates :foto, presence: true
    validates :tipo, presence: true
    
end

