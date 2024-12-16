module Administrativo  
  class ReservasController < ApplicationController
    before_action :set_reserva, only: %i[ show edit update destroy ]
    before_action :set_users, only: [:new, :edit, :show]
    before_action :set_quartos, only: [:new, :edit] 
    before_action :authenticate_admin!
    layout "administrativo"

    # GET /reservas or /reservas.json
    def index
      @reservas = Reserva.includes(:user).all
    end

    # GET /reservas/1 or /reservas/1.json
    def show
    end

    # GET /reservas/new
    def new
      @reserva = Reserva.new
    end

    # GET /reservas/1/edit
    def edit
    end


    
    # POST /reservas or /reservas.json
    def create
      @reserva = Reserva.new(reserva_params)

      respond_to do |format|
        if @reserva.save
          format.html { redirect_to [:administrativo, @reserva], notice: "Reserva criado com sucesso" }
          format.json { render :show, status: :created, location: @reserva }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @reserva.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /reservas/1 or /reservas/1.json
    def update
      respond_to do |format|
        if @reserva.update(reserva_params)
          format.html { redirect_to [:administrativo, @reserva], notice: "Reserva atualizada" }
          format.json { render :show, status: :ok, location: @reserva }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @reserva.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /reservas/1 or /reservas/1.json
    def destroy
      @reserva.destroy!

      respond_to do |format|
        format.html { redirect_to administrativo_reservas_path, status: :see_other, notice: "Reserva deletada com sucesso" }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_reserva
        @reserva = Reserva.find(params[:id])
      end
      
      def set_users
        @users = User.all
      end

      def set_quartos
        @quartos = Quarto.all
      end
  
      # Only allow a list of trusted parameters through.
      def reserva_params
        params.require(:reserva).permit(:data_entrada, :data_saida, :valor_total, :status, :user_id, :quarto_id)
      end
  end
end