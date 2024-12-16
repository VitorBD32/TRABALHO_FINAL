require 'csv'
require 'prawn'
class WelcomeController < ApplicationController
  def index
  
    @quartos = Quarto.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(@quartos), filename: "quartos-#{Date.today}.csv" }
      format.pdf { send_data generate_pdf(@quartos), filename: "quartos-#{Date.today}.pdf", type: "application/pdf" }
    end
  end
  private

  def generate_csv(quartos)
    CSV.generate(headers: true, encoding: "UTF-8") do |csv|
  
      csv << ["Número do Quarto", "Tipo", "Valor", "Situação"]
  
   
      quartos.each do |quarto|
        csv << [
          quarto.numero,
          quarto.tipo,
          quarto.preco,
          quarto.status
        ]
      end
    end
  end

  def generate_pdf(quartos)
    Prawn::Document.new do |pdf|
      # Cabeçalho
      pdf.text "Lista de Quartos", size: 24, style: :bold, align: :center
      pdf.move_down 20
  
      quartos.each do |quarto|
        pdf.text "Número do Quarto: #{quarto.numero}", size: 12, style: :bold
        pdf.text "Tipo: #{quarto.tipo}", size: 12
        pdf.text "Valor: R$ #{quarto.preco}", size: 12
        pdf.text "Situação: #{quarto.status}", size: 12
        pdf.move_down 10 
      end
  
   
      pdf.move_down 20
      pdf.text "Gerado em: #{Date.today.strftime('%d/%m/%Y')}", size: 10, align: :right
    end.render
  end
end
