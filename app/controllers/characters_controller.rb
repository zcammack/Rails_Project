class CharactersController < ApplicationController

    def index
        @characters = Character.all
    end

    def show
        @character = Character.find(params[:id])
    end

    def new

    end

    def edit

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

        def character_params
            params.require(:character).permit(:first_name, :last_name)
        end
end
