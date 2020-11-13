class ProfileController < ApplicationController

    def show

    end

    def edit

    end

    def new

    end

    def welcome
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
end