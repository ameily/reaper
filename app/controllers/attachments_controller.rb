class AttachmentsController < ApplicationController
    def create
        @soul = Soul.find(params[:soul_id])
        
        respond_to do |format|
            @attachment = @soul.attachments.new(attachment_params)

            if @attachment.save
                @soul.journals.create(
                    :body => "Attachment uploaded: *#{@attachment.name}*",
                    :cat => 'create'
                )
                format.json { render :json => @attachment, :methods => ['attachment_url'], :status => :created }
            else
                format.json { render json: @attachment.errors.messages, status: :bad_request }
            end
        end
    end

    def destroy
        @attachment = Attachment.find(params[:id])
        respond_to do |format|
            soul = @attachment.soul
            if @attachment.destroy
                soul.journals.create(
                    :body => "Attachment deleted: *#{@attachment.name}*",
                    :cat => 'create'
                )
                format.json { render json: { }, status: :ok }
            else
                format.json { render json: { }, status: :bad_request }
            end
        end
    end
 
    private def attachment_params
        params.require(:attachment).permit(:name, :description, :category, :attachment)
    end
end
