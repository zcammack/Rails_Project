class CampaignsController < ApplicationController

    before_action :get_campaign, only: [:show, :edit, :update, :destroy]

    def index
        @campaigns = Campaign.all
    end

    def show

    end

    def new
        @campaign = current_user.campaigns.new
    end

    def edit
        get_campaign
        if current_user != @campaign.user
            redirect_to campaigns_path
        else
            render 'edit'
        end
    end

    def create
        @campaign = current_user.campaigns.new(campaign_params)

        if @campaign.save
            redirect_to @campaign
        else
            render 'new'
        end
    end

    def update
        if @campaign.update(campaign_params)
            redirect_to @campaign
        else
            render 'edit'
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
        params.require(:campaign).permit(:title, :description, :setting, :dungeonmaster)
    end
end
