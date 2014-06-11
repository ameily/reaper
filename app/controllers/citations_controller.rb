class CitationsController < ApplicationController
    def create
        @soul = Soul.find(params[:soul_id])
        #redirect_to soul_path(@soul)
        @citation = @soul.citations.create(citation_params)
        
        respond_to do |format|
            format.json { render json: @citation, status: :created }
        end
    end

    def destroy
        @citation = Citation.find(params[:id])
        respond_to do |format|
            if @citation.destroy
                format.json { render json: { }, status: :ok }
            else
                
            end
        end
    end
 
    private def citation_params
        params.require(:citation).permit(:url)
    end
end
