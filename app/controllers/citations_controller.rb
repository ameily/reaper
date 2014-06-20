class CitationsController < ApplicationController
    def create
        @soul = Soul.find(params[:soul_id])
        #redirect_to soul_path(@soul)
        @citation = @soul.citations.new(citation_params)
        
        respond_to do |format|
            if @citation.save
                @soul.journals.create(
                    :body => "Citation added: *#{@citation.url}*",
                    :cat => "create"
                )
                format.json { render json: @citation, status: :created }
            else
                format.json { render json: @citations.errors.messages, status: :bad_request }
            end
        end
    end

    def destroy
        @citation = Citation.find(params[:id])
        respond_to do |format|
            soul = @citation.soul
            if @citation.destroy
                soul.journals.create(
                    :body => "Citation deleted: *#{@citation.url}*",
                    :cat => "delete"
                )
                format.json { render json: { }, status: :ok }
            else
                
            end
        end
    end
 
    private def citation_params
        params.require(:citation).permit(:url)
    end
end
