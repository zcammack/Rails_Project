class PlayersController < ApplicationController

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(name: player_params[:name], user: current_user)
		if @player.save
			@player.user.set_player_role
			redirect_to player_path(@player)
		else 
			flash[:notice] = "The player couldn't be saved"
			redirect_to new_player_path
		end
	end

	def show
		@player = Player.find(params[:id])
	end

	private

	def player_params
		params.require(:player).permit(:name, :party_id)
	end		
end