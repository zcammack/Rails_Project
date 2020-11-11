class CharactersController < ApplicationController

    before_action :get_character, only: [:show, :edit, :update, :destroy]

    def index
        @characters = Character.all
    end

    def show

    end

    def new

    end

    def edit
        get_character
    end

    def create
        @character = Character.new(character_params)

        if @character.save
            redirect_to @character
        else
            render 'new'
        end
    end

    def update

    end

    def destroy

    end

    private

    def get_character
        @character = Character.find(params[:id])
    end

    def character_params
        params.require(:character).permit(:first_name, :last_name)
    end
end
