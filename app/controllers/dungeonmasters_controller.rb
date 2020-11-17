class DungeonmastersController < ApplicationController

    before_action :set_dungeonmaster, only: [:parties_with_4_or_more, :show]

	def parties_with_4_or_more

	end

	def index
		@dungeonmasters = Dungeonmaster.all
	end

	def new
		@dungeonmaster = Dungeonmaster.new
	end

	def create
		@dungeonmaster = Dungeonmaster.new(name: dungeonmaster_params[:name], user: current_user)
		if @dungeonmaster.save
			@dungeonmaster.user.set_dungeonmaster_role
			redirect_to dungeonmaster_path(@dungeonmaster)
		else 
			flash[:notice] = "The dungeonmaster couldn't be saved"
			render :new
		end
	end

	def show
		@campaigns = @dungeonmaster.campaigns.all
	end

    private

    def set_dungeonmaster
        @dungeonmaster = Dungeonmaster.find(params[:id])
    end
    

	def dungeonmaster_params
		params.require(:dungeonmaster).permit(:name)
	end
end