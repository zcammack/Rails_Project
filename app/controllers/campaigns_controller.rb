class CampaignsController < ApplicationController

    before_action :get_campaign, only: [:show, :edit, :update, :destroy]
    before_action :get_dungeonmaster, only: [:create, :edit]
    def index
        @campaigns = Campaign.all
    end

    def show
        @url = dungeonmaster_campaign_path
        if @campaign.parties.size < @campaign.number_of_parties
            new_party_forms = @campaign.number_of_parties - @campaign.parties.size
            new_party_forms.times { @campaign.parties.build }
        end
    end

    def new
        @dungeonmaster = Dungeonmaster.find(params[:dungeonmaster_id])
        @campaign = Campaign.new
        @url = new_dungeonmaster_campaign_path(@dungeonmaster)
    end

    def edit
        if current_user != @dungeonmaster
            flash[:notice] = "You cannot edit other dungeonmaster's campaigns!"
            redirect_to campaigns_path
        else
            render 'edit'
        end
    end

    def create
        @campaign = @dungeonmaster.campaigns.build
        @campaign.update_attributes(campaign_params)
        if @campaign.save
            redirect_to dungeonmaster_campaign_path(@campaign.dungeonmaster, @dungeonmaster)
        else
            flash[:notice] = "The campaign couldn't be saved."
            redirect_to new_dungeonmaster_campaign_path(@dungeonmaster)
        end
    end

    def update
        @url = dungeonmaster_campaign_path
        @campaign.update_attributes(campaign_params)

        if @campaign.save
            flash[:notice] = "The campaign was successfully saved!"
            redirect_to dungeonmaster_campaign_path(@campaign.dungeonmaster, @campaign)
        else
            flash[:notice] = "The campaign was not able to save."
            render :edit
        end
    end

    def destroy
        @campaign.destroy
        redirect_to campaigns_path
    end


    private

    def get_dungeonmaster
        @dungeonmaster = Dungeonmaster.find(params[:id])
    end

    def get_campaign
        @campaign = Campaign.find(params[:id])
    end

	def campaign_params
		params.require(:campaign).permit(:title, :description, :dungeonmaster_id, :number_of_parties, parties_attributes: [:id, :name, :description, :size, :campaign_id])
	end
end
