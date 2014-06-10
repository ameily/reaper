class SoulsController < ApplicationController
    def new
        @soul = Soul.new
    end

    def create
        @soul = Soul.new(create_params)
        @soul.harvest_count = 0
        @soul.reap_count = 0
        @soul.rot_count = 0
        if @soul.save
            redirect_to @soul
        else
            render 'new'
        end
    end

    def show
        @soul = Soul.find(params[:id])
    end

    def index
        @souls = Soul.all
    end

    private def create_params
        params.require(:soul).permit(:name, :description)
    end
end
