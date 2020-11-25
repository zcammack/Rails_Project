class PartiesController < ApplicationController

    before_action :get_party, only: [:show, :edit, :update, :destroy]

    def index
        @parties = Campaign.find(params[:campaign_id]).parties
        @campaign = Campaign.find(params[:campaign_id])
    end

    def show
        @campaign = Campaign.find(params[:campaign_id])
    end

    def new
        @party = Party.new(campaign_id: params[:campaign_id])
    end

    def edit
        unless current_user == @campaign.user
            flash[:danger] = "You cannot edit other user's parties!"
            redirect_to campaign_parties_path
        end
    end

    def create 
        @party = Party.create(party_params)
        @party.campaign_id = params[:campaign_id]
        if @party.valid?
           @party.save
            redirect_to campaign_parties_path
        else
            flash[:notice] = "The party couldn't be saved."
            redirect_to new_campaign_party_path
        end
    end

    def destroy
        @party.destroy
        redirect_to campaign_parties_path
    end

    private

    def get_party
        @party = Party.find(params[:id])
    end
    
    def party_params
        params.require(:party).permit(:name, :campaign_id)
    end
end
