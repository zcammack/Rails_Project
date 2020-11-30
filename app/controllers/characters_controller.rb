class CharactersController < ApplicationController

    before_action :get_character, only: [:show, :edit, :update, :destroy]

    def index
        @party = Party.find(params[:party_id])
        @characters = Party.find(params[:party_id]).characters
    end

    def show
        @party = Party.find(params[:id])
    end

    def new
        if params[:party_id] && !Party.exists?(params[:party_id])
            redirect_to campaign_parties_path, alert: "Party not found."
        else
             @character = Character.new(party_id: params[:party_id])
        end
    end

    def edit
        if params[:party_id]
            @party = Party.find_by(id:params[:party_id])
            if @party.nil?
                redirect_to party_characters_path, alert: "Party not found."
            else
                @character = @party.characters.find_by(id: params[:id])
                redirect_to party_characters_path(party), alert: "Character not found." if @character.nil?
            end
        else
            get_character
        end
   end

    def create
        @character = current_user.characters.new(character_params)
        @character.party_id = params[:party_id]
        if @character.valid?
            @character.save
            redirect_to party_characters_path
        else
            flash[:notice] = "The character couldn't be saved."
            render 'new'
        end
    end

    def update
        if @character.update(character_params)
            flash[:notice] = "Character has been saved!"
            redirect_to party_characters_path(@character.party_id)
        else
            flash[:notice] = "The character couldn't be saved."
            render 'edit'
        end
    end

    def destroy
        @character.destroy
        redirect_to party_characters_path
    end

    private

    def get_character
        @character = Character.find(params[:id])
    end

    def character_params
        params.require(:character).permit(:name, :level, :profession)
    end
end
