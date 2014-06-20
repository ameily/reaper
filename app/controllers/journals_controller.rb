class JournalsController < ApplicationController
    def create
        @soul = Soul.find(params[:soul_id])
        #redirect_to soul_path(@soul)
        @journal = @soul.journals.new(journal_params)
        @journal.cat = 'comment'
        
        respond_to do |format|
            if @journal.save
                format.json { render json: @journal, status: :created }
            else
                format.json { render json: @journal.errors.messages, status: :bad_request }
            end
        end
    end

    def destroy
        @journal = Journal.find(params[:id])
        respond_to do |format|
            if @journal.destroy
                format.json { render json: { }, status: :ok }
            else
                
            end
        end
    end
 
    private def journal_params
        params.require(:journal).permit(:body)
    end
end
