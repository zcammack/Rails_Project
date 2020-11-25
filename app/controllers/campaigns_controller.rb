class CampaignsController < ApplicationController

    before_action :get_campaign, only: [:show, :edit, :update, :destroy]
    def index
        @campaigns = current_user.campaigns.all
    end

    def show
      
    end

    def new
        @campaign = current_user.campaigns.build
        @campaign.parties.build(name: "")
    end

    def edit
        unless current_user == @campaign.user
            flash[:danger] = "You cannot edit other user's campaigns!"
            redirect_to campaigns_path
        end
    end

    def create
        @campaign = current_user.campaigns.build(campaign_params)
        if @campaign.valid?
           @campaign.save
            redirect_to campaigns_path
        else
            flash[:notice] = "The campaign couldn't be saved."
            redirect_to new_campaign_path
        end
    end

    def update
        @url = campaign_path
        @campaign.update_attributes(campaign_params)

        if @campaign.save
            flash[:notice] = "The campaign was successfully saved!"
            redirect_to campaign_path(@campaign)
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

    def get_campaign
        @campaign = Campaign.find(params[:id])
    end

	def campaign_params
		params.require(:campaign).permit(
            :title,
            :description,
            parties_attributes: [
                :name,
                :size
            ]
        )
	end
end
