class CharactersController < ApplicationController

    before_action :get_character, only: [:show, :edit, :update, :destroy]

    def index
        @characters = Character.all
    end

    def show

    end

    def new
        @character = current_user.characters.build
    end

    def edit

    end

    def create
        @character = current_user.characters.new(character_params)
        binding.pry
        if @character.save
            redirect_to @character
        else
            render 'new'
        end
    end

    def update
        if @character.update(character_params)
            redirect_to @character
        else
            render 'edit'
        end
    end

    def destroy
        @character.destroy
        redirect_to characters_path
    end

    private

    def get_character
        @character = Character.find(params[:id])
    end

    def character_params
        params.require(:character).permit(:name, :level, :profession)
    end
end
