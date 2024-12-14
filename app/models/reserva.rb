class Reserva < ApplicationRecord
  belongs_to :user

end
# rails g migration AddUserToReserva