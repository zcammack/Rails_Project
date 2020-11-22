class PartiesController < ApplicationController

    def index
        if params[:campaign_id]
            @parties = Campaign.find(params[:campaign_id]).parties
        else
            @parties = Party.all
        end
    end

    def show
        @party = Party.find(params[:id])
    end

    def new
        @party = Party.new(campaign_id: params[:campaign_id])
    end

    def create 
        @party = Party.new(party_params)
        @party.save
    end


end
