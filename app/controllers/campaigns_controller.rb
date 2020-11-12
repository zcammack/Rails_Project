class CampaignsController < ApplicationController



    private

    def campaign_params
        params.require(:campaign).permit(:)
    end
end
