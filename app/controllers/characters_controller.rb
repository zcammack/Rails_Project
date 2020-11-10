class CharactersController < ApplicationController
    def new

    end

    def create
        @character = Character.new(character_params)

        @character.save
        redirect_to @character
    end

    private

        def character_params
            params.require(:character).permit(:first_name, :last_name)
        end
end
