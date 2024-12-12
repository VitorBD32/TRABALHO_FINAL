json.extract! reserva, :id, :data_entrada, :data_saida, :valor_total, :status, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
